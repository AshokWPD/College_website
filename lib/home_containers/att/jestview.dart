
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  final String downloadUrl;
  static String routename = 'PdfViewer';

  PdfViewer({required this.downloadUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('PDF VIEWER')),
      ),
      body: Center(
        child: RotatedBox(
            quarterTurns: 1, child: SfPdfViewer.network(downloadUrl)),
      ),
    );
  }
}
