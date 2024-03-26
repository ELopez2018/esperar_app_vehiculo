import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/const/navigate.dart';
import 'package:esperar_drivers/domain/blocs/welcome.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WelcomeProvider(),
      builder: (context, child) => const WelcomeScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              'assets/images/splash-f.png',
              fit: BoxFit.cover,
              height: size.height,
            )),
            Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.5),
            )),
            Positioned.fill(
              child: SafeArea(
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/logo.png',
                                fit: BoxFit.cover, height: size.width * 0.3),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Podrás realizar",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Ver mapas con compañeros en el camino\nEstar enterado de las noticias de tu empresa\nVer tu programación de rutas",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ButtonCustom(
                                  text: 'Iniciar Sesión',
                                  color: Colors.white,
                                  borderColor: Colors.transparent,
                                  background: primaryColor,
                                  onTap: () => push(context, 'login', null),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}