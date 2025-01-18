import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6CE),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Geffen Eearthquake',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/landmark.png',
                
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to the App!',
                style: TextStyle(fontSize: 20),
              ),
                SizedBox(height: 20),
                SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF35423C) // Button color
                  ),
                  onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  ),
                  child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white), // Font color
                  ),
                ),
                ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF35423C) // Button color
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  ),
                  child: Text('Register',
                  style: TextStyle(color: Colors.white), // Font color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
