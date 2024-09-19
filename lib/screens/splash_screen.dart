import 'dart:async';
import 'package:app/animation/page_transition.dart';
import 'package:app/screens/onboarding/onboarding1.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        FadePageRoute(
          page: const Onboarding1(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(99, 24, 175, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/Logo.svg',
              width: 125,
              height: 142,
            ),
            const SizedBox(height: 20),
            Text(
              'Craft My Plate',
              style: GoogleFonts.capriola(
                color: const Color.fromRGBO(247, 229, 183, 1),
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "You customize, We cater",
              style: GoogleFonts.courgette(
                color: const Color.fromRGBO(213, 182, 125, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
