import 'package:esperar_drivers/ui/screens.dart';
import 'package:flutter/material.dart';


Map<String, WidgetBuilder> routes(BuildContext context) => {
 '': (context) =>   SplashScreen.init(context),
      'welcome': (context) => WelcomeScreen.init(context),
      'login': (context) => LoginScreen.init(context),
      'layout': (context) => LayoutScreen.init(context),
    };
