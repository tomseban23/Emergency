import 'package:flutter/material.dart';

import 'package:notifi_emp/admin_section/screens/analyticspage.dart';
import 'package:notifi_emp/admin_section/screens/dashboardcnt.dart';
import 'package:notifi_emp/admin_section/screens/employeepage.dart';
import 'package:notifi_emp/admin_section/screens/newalert.dart';
import 'package:notifi_emp/admin_section/screens/settingspage.dart';

import 'package:notifi_emp/widgets/appbar.dart';
import 'package:notifi_emp/admin_section/screens/activedashboard.dart'; // Import the ActiveDashboard page


class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  bool _showActiveDashboard = false;

  // Define the pages for the bottom navigation bar
  static List<Widget> _widgetOptions = <Widget>[
    DashboardContent(), 
    EmployeeListScreen(),
    AnalyticsDashboard(),
    NewAlertPage(),
    Settingspage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showActiveDashboard = false; // Reset to default dashboard when switching tabs
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey[200],
    appBar: CustomAppBar(
      title: 'Emertify',
      subtitle: 'ACME Corporation',
      actionText: 'Building A',
    ),
    body: _showActiveDashboard
        ? Activedashboard()
        : _widgetOptions.elementAt(_selectedIndex),
    
    // Only show FAB when on Dashboard tab (index 0)
    floatingActionButton: _selectedIndex == 0
        ? FloatingActionButton(
            onPressed: () {
              setState(() {
                _showActiveDashboard = !_showActiveDashboard;
              });
            },
            child: Icon(
              _showActiveDashboard ? Icons.dashboard : Icons.analytics,
            ),
            backgroundColor: Colors.orange,foregroundColor: Colors.white,
          )
        : null,

    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Employees',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: 'Analytics',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'New Alert',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.orange,
      onTap: _onItemTapped,
    ),
  );
}

}


