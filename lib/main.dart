import 'package:cv_app/screens/home.dart';
import 'package:cv_app/screens/navigation.dart';
import 'package:cv_app/screens/pdf_view.dart';
import 'package:cv_app/screens/questions.dart';
import 'package:cv_app/screens/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/navigation': (context) => Navigation(key: key),
        '/questions': (context) => Questions(key: key),
        '/pdfView': (context) => PDFView(key: key),
        '/settings': (context) => Settings(key: key),
      },
    );
  }
}
