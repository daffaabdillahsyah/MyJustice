import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color to blue here
      backgroundColor: Color(
          0xFF0E356F), // You can choose a different shade of blue if you like
      body: Center(
        // Replace this Text widget with an Image widget
        child: Image.asset(
          'assets/splash_logo.png', // Replace with your image asset path
          width: 247,
          height: 247,
          fit: BoxFit.contain, // This is optional, depending on how you want to display the image
        ),
      ),
    );
  }
}
