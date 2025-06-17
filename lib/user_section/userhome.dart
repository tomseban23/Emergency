import 'package:flutter/material.dart';
import 'package:notifi_emp/user_section/message.dart';
import 'package:notifi_emp/user_section/profile.dart';
import 'package:notifi_emp/user_section/saftypage.dart';
import 'package:notifi_emp/user_section/user_widgets/custappbar.dart';
import 'package:notifi_emp/user_section/userhomecnt.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    UserHomeCnt(),
    Saftypage(),
    EmployeeListPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomUserAppBar(), 
            SizedBox(height: 10),
            Expanded(
              child: _pages[_currentIndex], 
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shield), label: 'Safety'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
