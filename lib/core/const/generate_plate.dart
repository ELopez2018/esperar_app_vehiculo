import 'package:flutter/material.dart';

class PlateVehicle extends StatelessWidget {
  const PlateVehicle({
    super.key,
    required this.background,
    this.plate,
    this.number,
    this.width,
    this.fontSize,
  });

  final Color background;
  final String? plate;
  final int? number;
  final double? width;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ??
          (plate == null && number == null
              ? 100
              : plate != null
                  ? 100
                  : 60),
      height: 35,
      child: CustomPaint(
        painter: GenerateVehiclePlate(
            text: plate == null && number == null
                ? "ABC 123"
                : plate != null
                    ? plate!
                    : number.toString(),
            color: background,
            fontSize: fontSize),
      ),
    );
  }
}

class GenerateVehiclePlate extends CustomPainter {
  GenerateVehiclePlate(
      {required this.text, required this.color, this.fontSize});
  final String text;
  final Color color;
  final double? fontSize;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint colorPaint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
        colorPaint);

    final Paint blackBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawRect(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)),
        blackBorderPaint);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize ?? 16.0,
            fontWeight: FontWeight.w700),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(
        canvas,
        Offset((size.width - textPainter.width) / 2,
            (size.height - textPainter.height) / 2));

    final Paint blackDotPaint = Paint()..color = Colors.black;
    canvas.drawCircle(const Offset(10, 10), 2, blackDotPaint);
    canvas.drawCircle(Offset(size.width - 10, 10), 2, blackDotPaint);
    canvas.drawCircle(Offset(10, size.height - 10), 2, blackDotPaint);
    canvas.drawCircle(
        Offset(size.width - 10, size.height - 10), 2, blackDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(covariant CustomPainter oldDelegate) => false;
}
