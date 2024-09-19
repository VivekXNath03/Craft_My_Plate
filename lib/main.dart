import 'package:app/screens/auth/login_screen.dart';
import 'package:app/screens/auth/otp_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/onboarding/onboarding1.dart';
import 'package:app/screens/onboarding/onboarding2.dart';
import 'package:app/screens/onboarding/onboarding3.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const CraftMyPlateApp());
}

class CraftMyPlateApp extends StatelessWidget {
  const CraftMyPlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(99, 24, 175, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/onboarding1': (context) => const Onboarding1(),
        '/onboarding2': (context) => const Onboarding2(),
        '/onboarding3': (context) => const Onboarding3(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}
