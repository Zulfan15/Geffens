import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'login.dart';
// import 'register.dart';
// import 'home.dart';
import 'splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        // '/': (context) => HomePage(),
      },
    );
  }
}