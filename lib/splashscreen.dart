import 'package:flutter/material.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:geffens/home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark, // Warna tema (white, dark, atau custom)
      showBefore: (BuildContext context) {
        return Image.asset(
          'assets/images/landmark.png', // Path logo (pastikan logo ada di folder assets)
          width: 100, // Set the desired width
          height: 100, // Set the desired height
        );
            },
      onFinish: (BuildContext context) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
  }
}
