import 'package:flutter/material.dart';

class IndicatorRoute extends StatelessWidget {
  const IndicatorRoute({
    super.key,
    required this.text,
    this.endRoute,
  });
  final String text;
  final bool? endRoute;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 300,
      ),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.location_on_rounded,
                color: endRoute != null ? Colors.green : Colors.orange,
              ),
            ),
            Expanded(
                child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ),
      ),
    );
  }
}
