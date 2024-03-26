import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/const/navigate.dart';
import 'package:esperar_drivers/core/const/state_progress.dart';
import 'package:esperar_drivers/core/const/validators.dart';
import 'package:esperar_drivers/domain/blocs/login.dart';
import 'package:esperar_drivers/domain/repositories/auth.dart';
import 'package:esperar_drivers/domain/repositories/local_storage.dart';
import 'package:esperar_drivers/domain/repositories/user.dart';
import 'package:esperar_drivers/ui/widgets/recover%20password/generate%20code/generate_code.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(
        localStorageInterface:
            Provider.of<LocalStorageInterface>(context, listen: false),
        authInterface: Provider.of<AuthInterface>(context, listen: false),
        userInterface: Provider.of<UserInterface>(context, listen: false),
      ),
      builder: (context, child) => const LoginScreen._(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginProvider>(context);
    final Size size = MediaQuery.of(context).size;

    login() async {
      if (_formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        final result = await bloc.login();
        if (result != null && result) {
          pushReplacement(context, 'layout', null);
        } else if (bloc.error != null) {
          final snackBar = SnackBar(
            content: Text(bloc.error ?? 'error'),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputCustom(
                            label: 'Usuario',
                            controller: bloc.user,
                            validator: validateNotEmpty,
                          ),
                          InputCustom(
                            label: 'Contraseña',
                            controller: bloc.password,
                            validator: validatedPassword,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () => bloc.setShowRecoverPassword(),
                              child: const Text(
                                'Olvidar contraseña',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: ButtonCustom(
                              text: 'Iniciar sesión',
                              color: Colors.white,
                              onTap: login,
                              background: primaryColor,
                              width: size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: primaryColor,
                                    height: 2,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('o inicie session con'),
                                ),
                                Expanded(
                                  child: Container(
                                    color: primaryColor,
                                    height: 2,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                ),
                                child: Image.asset('assets/icons/google.png'),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                ),
                                child:
                                    Image.asset('assets/icons/microsoft.png'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (bloc.state == StateProgress.loading)
              const ProgressIndicatorCustom(),
            const Positioned(left: 20, top: 20, child: ButtonBackScreen()),
            if (bloc.getShowRecoverPassword())
              GenerateCode.init(context, bloc.setShowRecoverPassword)
          ],
        ),
      ),
    );
  }
}
