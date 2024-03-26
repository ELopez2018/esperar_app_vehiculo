import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/core/const/validators.dart';
import 'package:esperar_drivers/domain/blocs/recover_password.dart';
import 'package:esperar_drivers/ui/widgets/recover%20password/change%20password/change_password.dart';
import 'package:esperar_drivers/ui/widgets/recover%20password/validate%20code/validate_code.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenerateCode extends StatelessWidget {
  const GenerateCode._(this.close);

  static Widget init(BuildContext context, Function close) {
    return ChangeNotifierProvider(
      create: (context) => RecoverPasswordProvider()..setClose(close),
      builder: (context, child) => GenerateCode._(close),
    );
  }

  final Function close;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RecoverPasswordProvider>(context);
    return Stack(
      children: [
        const ProgressIndicatorCustom(
          circularProgress: false,
        ),
        if (!bloc.getShowValidateCode())
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 260,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: GestureDetector(
                        onTap: () => close(),
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
                  const Text(
                    'Restablecer contraseña',
                    style: TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InputCustom(
                      label: 'Correo',
                      validator: validatedEmail,
                    ),
                  ),
                  ButtonCustom(
                    text: 'Olvidar contraseña',
                    onTap: () {
                      bloc.setShowValidateCode();
                    },
                    color: Colors.white,
                    background: primaryColor,
                  )
                ],
              ),
            ),
          ),
        if (bloc.getShowValidateCode())
          const Positioned(child: ValidatedCodeScreen()),
        if (bloc.getShowChangePassword()) const ChangePassword()
      ],
    );
  }
}
