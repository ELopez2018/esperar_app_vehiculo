import 'package:esperar_drivers/domain/entities/dropdown.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle_request.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicle_update.dart';
import 'package:esperar_drivers/domain/entities/vehicle/vehicles_response.dart';
import 'package:esperar_drivers/domain/repositories/vehicle.dart';
import 'package:esperar_drivers/domain/services/vehicle.dart';

class VehicleRepository extends VehicleInterface {
  VehicleRepository({
    required this.vehicleServiceInterface,
  });

  final VehicleServiceInterface vehicleServiceInterface;

  @override
  Future<bool?> assignDriverToVehicle(int vehicleId, int driverId) async {
    return vehicleServiceInterface.assignDriverToVehicle(vehicleId, driverId);
  }

  @override
  Future<Vehicle?> createVehicle(VehicleRequest vehicle) async {
    return await vehicleServiceInterface.createVehicle(vehicle);
  }

  @override
  Future<VehiclesResponse?> getVehicles(int company) async {
    return await vehicleServiceInterface.getVehicles(company);
  }

  @override
  Future<List<Dropdown>?> getStatus() async {
    return await vehicleServiceInterface.getStatus();
  }

  @override
  Future<Vehicle?> updateVehicle(VehicleUpdate vehicle, int vehicleId) async {
    return await vehicleServiceInterface.updateVehicle(vehicle, vehicleId);
  }

  @override
  Future<VehiclesResponse?> getVehiclesByRoute(int route) async {
    return await vehicleServiceInterface.getVehiclesByRoute(route);
  }
}
