import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_request.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_update.dart';
import 'package:esperar_drivers/domain/entities/driver/drivers_response.dart';
import 'package:esperar_drivers/domain/entities/dropdown.dart';
import 'package:esperar_drivers/domain/entities/user/user.dart';
import 'package:esperar_drivers/domain/repositories/driver.dart';
import 'package:esperar_drivers/domain/services/driver.dart';

class DriverRepository extends DriverInterface {
  DriverRepository({
    required this.driverServiceInterface,
  });

  final DriverServiceInterface driverServiceInterface;

  @override
  Future<Driver?> createDriver(DriverRequest driver) async {
    try {
      return await driverServiceInterface.createDriver(driver);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<User> getDriverByUsername(String username) async {
    try {
      return await driverServiceInterface.getDriverByUsername(username);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<Driver?> updateDriver(DriverUpdate user, int id) async {
    try {
      return await driverServiceInterface.updateDriver(user, id);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<DriversResponse?> getDrivers(int id) async {
    try {
      return await driverServiceInterface.getDrivers(id);
    } on String catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Dropdown>?> getGender() async {
    return await driverServiceInterface.getGender();
  }

  @override
  Future<List<Dropdown>?> getDocumentTypes() async {
    return await driverServiceInterface.getDocumentTypes();
  }
}
