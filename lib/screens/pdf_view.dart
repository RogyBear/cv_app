import 'package:cv_app/components/custom_back_button.dart';
import 'package:cv_app/components/fox_head.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomBackButton(),
            Text(
              'Переглянути резюме',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito',
                color: Colors.black,
              ),
            ),
            FoxHead(),
          ],
        ),
      ),
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
