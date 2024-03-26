import 'package:esperar_drivers/domain/blocs/layout.dart';
import 'package:esperar_drivers/ui/map/widgets/vehicle_indicator_route.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutBloc = Provider.of<LayoutProvider>(context);
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(child: Consumer<LayoutProvider>(
                builder: (context, value, child) {
                  final currentPosition = value.currentPosition;
                  if (currentPosition != null) {
                    return GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(currentPosition.latitude,
                              currentPosition.longitude),
                          zoom: 15.7),
                      myLocationEnabled: true,
                      polylines: layoutBloc.polylines,
                      onMapCreated: (controller) {
                        layoutBloc.setMapController(
                            controller); // Inicializar el mapa y establecer el controlador
                      },
                    );
                  } else {
                    return GoogleMap(
                      initialCameraPosition: const CameraPosition(
                          target: LatLng(4.146347, -73.641619), zoom: 13.7),
                      polylines: layoutBloc.polylines,
                    );
                  }
                },
              )),
              if (layoutBloc.route != null)
                Positioned.fill(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Column(
                          children: [
                            IndicatorRoute(text: layoutBloc.route!.from!),
                            SizedBox(height: 10),
                            IndicatorRoute(
                                text: layoutBloc.route!.to!, endRoute: true),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10,
                        right: 10,
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ButtonCustom(
                              text: 'Finalizar ruta',
                              color: Colors.white,
                              background: Colors.red,
                              width: 120,
                              onTap: () {
                                layoutBloc.route = null;
                                layoutBloc.polylines = {};
                              },
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 120,
                                maxWidth: 210,
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.green,
                                        ),
                                        child: const Icon(
                                            Icons.arrow_upward_outlined),
                                      ),
                                      const SizedBox(height: 30),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                        child: const Icon(
                                            Icons.arrow_downward_outlined),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: SizedBox(
                                      height: 180,
                                      child: Column(
                                        children: [
                                          const VehicleIndicatorRoute(
                                            vehiclesAhead: true,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Container(
                                              height: 10,
                                              color: Colors.green,
                                            ),
                                          ),
                                          const VehicleIndicatorRoute(),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
