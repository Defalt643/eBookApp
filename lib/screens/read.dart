import 'package:book_app/data/data.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents Homepage for Navigation
class Reader extends StatefulWidget {
  get detail => Data().details;
  Reader(this.item, this.i);
  final item, i;
  @override
  _Reader createState() => _Reader(item, i);
}

class _Reader extends State<Reader> {
  var item, i;
  get detail => Data().details;
  _Reader(this.item, this.i);
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            detail[i]["theme"]["A"],
            detail[i]["theme"]["R"],
            detail[i]["theme"]["G"],
            detail[i]["theme"]["B"]),
        centerTitle: true,
        title: Text(
          item,
        ),
      ),
      body: SfPdfViewer.asset(detail[i]["pdfPath"]),
    ));
  }
}
