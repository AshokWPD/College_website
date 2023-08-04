import 'package:dsa_web/responsive/lap_home.dart';
import 'package:dsa_web/responsive/responsive_layout.dart';
import 'package:dsa_web/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyARkdzgkNxWrIyhMbzU4_6vEHgmPh885Us",
          appId: "1:157662210724:web:9b15b8c694293ab5f19431",
          messagingSenderId: "157662210724",
          projectId: "dsa-web-app",
          storageBucket: "gs://dsa-web-app.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      initialRoute: ResponsiveSplash.routeName,
      routes: routes,
    );
  }
}
