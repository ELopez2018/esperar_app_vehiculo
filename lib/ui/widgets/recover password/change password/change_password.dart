import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/const/validators.dart';
import 'package:esperar_drivers/domain/blocs/recover_password.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RecoverPasswordProvider>(context);
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 350,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: GestureDetector(
                          onTap: () => bloc.close(),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InputCustom(
                      label: 'Nueva contraseña',
                      controller: bloc.password,
                      validator: validatedPassword,
                    ),
                    InputCustom(
                      label: 'Verificar contraseña',
                      controller: bloc.verifyPassword,
                      validator: (String? value) =>
                          validateEqualPassword(value, bloc.password.text),
                    ),
                    ButtonCustom(
                      text: 'Cambiar Contraseña',
                      onTap: () {},
                      background: primaryColor,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
