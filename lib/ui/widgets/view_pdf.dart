import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ViewPdf extends StatelessWidget {
  const ViewPdf({super.key, required this.filePath});
  final String filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: PDFView(
          filePath: filePath,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: true,
          pageFling: false,
          onError: (error) {},
          onPageError: (page, error) {},
          onPageChanged: (int? page, int? total) {},
        ));
  }
}
