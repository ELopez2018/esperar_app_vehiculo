import 'package:esperar_drivers/domain/entities/driver/driver.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_request.dart';
import 'package:esperar_drivers/domain/entities/driver/driver_update.dart';
import 'package:esperar_drivers/domain/entities/driver/drivers_response.dart';
import 'package:esperar_drivers/domain/entities/dropdown.dart';
import 'package:esperar_drivers/domain/entities/user/user.dart';

abstract class DriverInterface {
  Future<User> getDriverByUsername(String username);
  Future<Driver?> createDriver(DriverRequest driver);
  Future<Driver?> updateDriver(DriverUpdate user, int id);
  Future<DriversResponse?> getDrivers(int id);
  Future<List<Dropdown>?> getGender();
  Future<List<Dropdown>?> getDocumentTypes();
}
