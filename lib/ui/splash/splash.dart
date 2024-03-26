import 'package:esperar_drivers/core/const/navigate.dart';
import 'package:esperar_drivers/domain/blocs/splash.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/repositories/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(
        userInterface: Provider.of<UserInterface>(context, listen: false),
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
      )..validate(),
      builder: (context, child) => const SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    validate();
    super.initState();
  }

  void validate() async {
    final bloc = Provider.of<SplashProvider>(context, listen: false);
    final response = await bloc.validate();
    if (response != null && response) {
      pushReplacement(context, 'layout', null);
    } else {
      pushReplacement(context, 'welcome', null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
