import 'package:flutter/material.dart';

class PDFView extends StatefulWidget {
  const PDFView({Key? key}) : super(key: key);

  @override
  State<PDFView> createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'hey!',
          style: TextStyle(
              fontFamily: 'Nunito', fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
