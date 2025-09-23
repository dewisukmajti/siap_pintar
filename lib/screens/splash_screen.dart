import 'package:flutter/material.dart';
import 'dart:async';
import 'onboarding_screen.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53E3E), // Merah muda elegan
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // 
          width: 140,
          height: 140,
        ),
      ),
    );
  }
}
