import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.background,
    this.color,
    this.borderColor,
    this.boxShadow,
  });

  final String text;
  final GestureTapCallback onTap;
  final double? width;
  final Color? background;
  final Color? color;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(minWidth: width ?? 120, maxWidth: width ?? 200),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 45,
          decoration: BoxDecoration(
              border: Border.all(color: borderColor ?? Colors.black),
              color: background,
              boxShadow: boxShadow),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w600, color: color),
          ),
        ),
      ),
    );
  }
}
