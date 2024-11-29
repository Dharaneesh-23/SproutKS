import 'package:flutter/material.dart';
import 'package:sprout_lms/pages/certificate_page.dart';
import 'package:sprout_lms/pages/course_page.dart';
import 'package:sprout_lms/pages/tutorial_page.dart';
import 'package:sprout_lms/pages/proflie_home.dart';
import 'package:sprout_lms/pages/notificatino_page.dart';

void main() {
  runApp(MaterialApp(
    home: Mainpage(),
    debugShowCheckedModeBanner: false,
  ));
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Sprout_logo.jpg',
          fit: BoxFit.contain,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 30.0,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          )
        ],
        backgroundColor: Colors.white10,
      ),
      body: const CoursePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
        selectedItemColor: Colors.deepOrange,
      ),
    );
  }
}
