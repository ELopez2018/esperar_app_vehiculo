import 'dart:io';

import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({super.key, required this.filePath});
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InteractiveViewer(
        child: Image.file(
          File(filePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
