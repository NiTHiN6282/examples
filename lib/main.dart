
import 'package:flutter/material.dart';
import 'package:test1/authentication/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test1/authentication/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/login': (BuildContext context) => const LoginPage()
    },
    home: SplashScreen(),
  ));
}
