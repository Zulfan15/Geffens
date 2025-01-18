import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:geffens/contact/contact.dart';
import 'package:geffens/contact/contactPage.dart';
import 'earthquake_page.dart'; // Import the earthquake_page.dart file
import 'login.dart';
import 'profile.dart';
import 'package:geffens/gempaskuy/lib/fragment/fragment_dirasakan.dart';
import 'package:geffens/gempaskuy/lib/fragment/fragment_magnitudo.dart';
import 'package:geffens/gempaskuy/lib/fragment/fragment_terkini.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    FragmentTerkini(),
    FragmentMagnitudo(),
    FragmentDirasakan(),
    ContactPageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6CE),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1E6CE),
        automaticallyImplyLeading: false, // Remove the back arrow
        title: Text('Geffens'),
        actions: [
          IconButton(
        icon: Icon(Icons.logout),
        onPressed: () {
          // Sign out the user
          // Navigate to the login page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: _currentPage,
        barHeight: 60,
        circleSize: 50,
        tabs: [
          TabData(icon: Icons.restart_alt),
          TabData(icon: Icons.read_more_sharp),
          TabData(icon: Icons.query_stats_sharp),
          TabData(icon: Icons.contacts),
          TabData(icon: Icons.person),
        ],
        onTabChangedListener: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
