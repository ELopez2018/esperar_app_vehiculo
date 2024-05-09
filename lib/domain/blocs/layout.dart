
import 'dart:async';
import 'dart:convert';
import 'package:esperar_drivers/domain/entities/driver/driver_location.dart';
import 'package:esperar_drivers/domain/entities/routes/route.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class LayoutProvider extends ChangeNotifier {
  LayoutProvider(this.localStorageInterface) {
    _initLocationTracking();
  }

  final LocalStorageInterface localStorageInterface;

  int _page = 0;
  Routes? route;
  Vehicle? vehicle;
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};
  late StreamSubscription<Position> _positionStreamSubscription;
  Position? _currentPosition;
  Position? _previousPosition;
    GoogleMapController? _mapController; // Controlador de Google Maps


void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

   void moveCameraToPosition(LatLng newPosition) {
    if (_mapController != null) {
      _mapController!.animateCamera(CameraUpdate.newLatLng(newPosition));
    }
  }

  void setPage(int value) {
    _page = value;
    notifyListeners();
  }

  int getPage() => _page;

void _initLocationTracking() {
  _previousPosition = null; 
  _positionStreamSubscription = Geolocator.getPositionStream().listen((position) {
    _currentPosition = position;
      moveCameraToPosition(LatLng(_currentPosition!.latitude, _currentPosition!.longitude));
    if (_previousPosition != null && route != null) {
      double distanceInMeters = Geolocator.distanceBetween(
          _previousPosition!.latitude,
          _previousPosition!.longitude,
          _currentPosition!.latitude,
          _currentPosition!.longitude);
      if (distanceInMeters >= 10) {
        Map<String, dynamic> data = {
          "vehicle": 1,
          "route": route!.id,
          "latitude": _currentPosition!.latitude,
          "longitude": _currentPosition!.longitude
        };
        socketService
            .getStompClient()
            .send(destination: '/api/init-route', body: json.encode(data));
        
        _previousPosition = _currentPosition!;
      }
    } else {
      _previousPosition = _currentPosition!;
    }
    notifyListeners();
  });
}

  Position? get currentPosition => _currentPosition;

  void init(Routes? value) async {
    final a = await localStorageInterface.getUser();
    route = value;
    socketService.getStompClient().activate();
    if (route != null) {
      listenVehicles(route!.id!);
      paintPolyline(route!);
    }
    notifyListeners();
  }

  void listenVehicles(int id) {
    socketService.getStompClient().subscribe(
          destination: '/topic/route/$id',
          callback: (StompFrame data) {
            print(data);
            final driverJson = jsonDecode(data.body!);
            final driver = DriverLocation.fromJson(driverJson);
            updateMarker(
              driver.driver.id.toString(),
              LatLng(
                double.parse(driver.coordinates.first.latitude),
                double.parse(driver.coordinates.first.longitude),
              ),
            );
          },
        );
  }

  void paintPolyline(Routes route) {
    polylines = {};
    Polyline polyline = Polyline(
      polylineId: PolylineId(route.id.toString()),
      color: Colors.blue,
      width: 5,
      points: route.coordinates!
          .map(
            (e) => LatLng(
              double.parse(e!.latitude),
              double.parse(e.longitude),
            ),
          )
          .toList(),
    );
    polylines.add(polyline);
    if (route.coordinates!.isNotEmpty) {
      markers.add(
        Marker(
          markerId: MarkerId('${route.id}.1'),
          position: route.coordinates!
              .map(
                (e) => LatLng(
                  double.parse(e!.latitude),
                  double.parse(e.longitude),
                ),
              )
              .toList()
              .first,
          infoWindow: const InfoWindow(title: 'Inicio de la ruta'),
        ),
      );
      markers.add(
        Marker(
          markerId: MarkerId('${route.id}.2'),
          position: route.coordinates!
              .map(
                (e) => LatLng(
                  double.parse(e!.latitude),
                  double.parse(e.longitude),
                ),
              )
              .toList()
              .last,
          infoWindow: const InfoWindow(title: 'Fin de la ruta'),
        ),
      );
    }
  }

  void updateMarker(String vehicleId, LatLng newPosition) {
    List<Marker> markerList = markers.toList();

    int markerIndex = markerList.indexWhere(
      (marker) => marker.markerId.value == vehicleId,
    );
    if (markerIndex != -1) {
      markers.remove(markerList[markerIndex]);
    }
    markers.add(
      Marker(
        markerId: MarkerId(vehicleId),
        position: newPosition,
        infoWindow: InfoWindow(title: 'Vehicle $vehicleId'),
      ),
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _positionStreamSubscription.cancel();
    super.dispose();
  }
}
