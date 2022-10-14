import 'package:cv_app/screens/home.dart';
import 'package:cv_app/screens/navigation.dart';
import 'package:cv_app/screens/pdf_view.dart';
import 'package:cv_app/screens/questions.dart';
import 'package:cv_app/screens/settings.dart';
import 'package:cv_app/services/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const CvApp());
}

class CvApp extends StatefulWidget {
  const CvApp({super.key});
  @override
  State<CvApp> createState() => _CvAppState();
}

class _CvAppState extends State<CvApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/navigation': (context) => Navigation(),
          '/questions': (context) => Questions(),
          '/pdfView': (context) => PDFView(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
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
      ),
    );
  }
}
