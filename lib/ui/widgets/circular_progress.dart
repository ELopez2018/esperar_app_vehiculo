import 'package:esperar_drivers/core/const/colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({
    super.key,
    this.circularProgress = true,
  });

  final bool circularProgress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: primaryColor.withOpacity(0.5),
          ),
        ),
        if (circularProgress)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
