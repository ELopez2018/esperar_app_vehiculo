import 'package:esperar_drivers/core/const/colors.dart';
import 'package:esperar_drivers/domain/blocs/recover_password.dart';
import 'package:esperar_drivers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void validatedCode(BuildContext context) async {
  final result =
      await Provider.of<RecoverPasswordProvider>(context, listen: false)
          .validatedCode();
  FocusManager.instance.primaryFocus?.unfocus();
  if (result != null) {
    const snackBar = SnackBar(
      content: Text("El código es valido!"),
      backgroundColor: primaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  } else {
    final snackBar = SnackBar(
      content: Text(
          Provider.of<RecoverPasswordProvider>(context, listen: false).error!),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ValidatedCodeScreen extends StatelessWidget {
  const ValidatedCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RecoverPasswordProvider>(context);
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 250,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () => bloc.setShowValidateCode(),
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Restablecer contraseña",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const RecoverPasswordCodeValidated(),
                    const SizedBox(height: 20),
                    ButtonCustom(
                      text: 'Validar Codigo',
                      background: primaryColor,
                      color: Colors.white,
                      onTap: () {
                        //validatedCode(context);
                        bloc.setShowChangePassword();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecoverPasswordCodeValidated extends StatelessWidget {
  const RecoverPasswordCodeValidated({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<RecoverPasswordProvider>(context);
    final List<FocusNode> focus = List.generate(
      6,
      (index) => FocusNode(),
    );
    focus[0].requestFocus();
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          6,
          (index) => InputCodeRecoverPassword(
            controllers: bloc.controllers,
            focus: focus,
            index: index,
          ),
        ),
      ),
    );
  }
}

class InputCodeRecoverPassword extends StatelessWidget {
  const InputCodeRecoverPassword({
    super.key,
    required this.focus,
    required this.controllers,
    required this.index,
  });

  final List<FocusNode> focus;
  final List<TextEditingController> controllers;
  final int index;
  @override
  Widget build(BuildContext context) {
    final inputFormatter =
        FilteringTextInputFormatter.allow(RegExp(r'^[0-9A-Za-z]{0,1}'));
    void validatedFields() {
      if (index != 0) {
        for (int i = 0; i < index; i++) {
          if (controllers[i].text.isEmpty) {
            return focus[i].requestFocus();
          }
        }
      }
    }

    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: 10),
        ),
        focusNode: focus[index],
        controller: controllers[index],
        keyboardType: TextInputType.number,
        inputFormatters: [inputFormatter],
        onChanged: (value) {
          if (value.isNotEmpty && index != 5) {
            focus[index + 1].requestFocus();
          } else if (index == 5) {
            //TODO: validate code
          }
        },
        onTap: () {
          validatedFields();
        },
      ),
    );
  }
}
