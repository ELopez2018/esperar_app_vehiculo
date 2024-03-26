import 'package:esperar_drivers/core/const/navigate.dart';
import 'package:flutter/material.dart';

class ButtonBackScreen extends StatelessWidget {
  const ButtonBackScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pop(context, null),
      child: const Icon(Icons.arrow_back),
    );
  }
}
