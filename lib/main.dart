import 'package:esperar_drivers/config/host.dart';
import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/routes/routes.dart';
import 'package:esperar_drivers/data/repositories/auth.dart';
import 'package:esperar_drivers/data/repositories/country_state_city.dart';
import 'package:esperar_drivers/data/repositories/driver.dart';
import 'package:esperar_drivers/data/repositories/local_storage.dart';
import 'package:esperar_drivers/data/repositories/routes.dart';
import 'package:esperar_drivers/data/repositories/user.dart';
import 'package:esperar_drivers/data/repositories/vehicle.dart';
import 'package:esperar_drivers/data/services/auth.dart';
import 'package:esperar_drivers/data/services/country_state_city.dart';
import 'package:esperar_drivers/data/services/driver.dart';
import 'package:esperar_drivers/data/services/routes.dart';
import 'package:esperar_drivers/data/services/socket.dart';
import 'package:esperar_drivers/data/services/user.dart';
import 'package:esperar_drivers/data/services/vehicle.dart';
import 'package:esperar_drivers/domain/blocs/pop_ups.dart';
import 'package:esperar_drivers/domain/repositories/auth.dart';
import 'package:esperar_drivers/domain/repositories/country_state_city.dart';
import 'package:esperar_drivers/domain/repositories/driver.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/repositories/routes.dart';
import 'package:esperar_drivers/domain/repositories/user.dart';
import 'package:esperar_drivers/domain/repositories/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

SocketService socketService = SocketService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.location.request();

  await socketService.init('$apiHost/ws');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalStorageInterface>(
          create: (context) => LocalStorageRepository(),
        ),
        Provider(
          create: (context) => socketService,
        )
      ],
      builder: (context, child) => MultiProvider(
        providers: [
          Provider<AuthInterface>(
            create: (context) => AuthRepository(
              authServiceInterface: AuthService(),
            ),
          ),
          Provider<DriverInterface>(
            create: (context) => DriverRepository(
              driverServiceInterface: DriverService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false),
              ),
            ),
          ),
          Provider<RoutesInterface>(
            create: (context) => RoutesRepository(
              routesServiceInterface: RouteService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false),
              ),
            ),
          ),
          Provider<UserInterface>(
            create: (context) => UserRepository(
              userServiceInterface: UserService(
                localStorageInterface:
                    Provider.of<LocalStorageInterface>(context, listen: false),
              ),
            ),
          ),
          Provider<VehicleInterface>(
            create: (context) => VehicleRepository(
                vehicleServiceInterface: VehicleService(
              localStorageInterface:
                  Provider.of<LocalStorageInterface>(context, listen: false),
            )),
          ),
          Provider<CountyStateCityInterface>(
            create: (context) => CountyStateCity(
              countryStateCityService: CountryStateCityService(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => PopUpsProvider(),
          )
        ],
        builder: (context, child) => MaterialApp(
          title: 'Esperar Conductores',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              useMaterial3: true,
              checkboxTheme: CheckboxThemeData()),
          initialRoute: '',
          routes: routes(context),
        ),
      ),
    );
  }
}
