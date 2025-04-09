// Main Emergency Dashboard Page that combines all widgets
import 'package:flutter/material.dart';
import 'package:notifi_emp/widgets/Active/empmap.dart';
import 'package:notifi_emp/widgets/Active/overallprogress.dart';
import 'package:notifi_emp/widgets/Active/recentalert.dart';
import 'package:notifi_emp/widgets/Active/scheudledrill.dart';
import 'package:notifi_emp/widgets/activealertconatiner.dart';
import 'package:notifi_emp/widgets/Active/emgcntactive.dart';
import 'package:notifi_emp/widgets/recentlyupdatemp.dart';

class Activedashboard extends StatelessWidget {
  const Activedashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Main alert container at the top
            EmergencyDashboard(),
            
            // Additional components
            EmployeeMapWidget(),
            
            // Recently updated employees list
            RecentlyUpdatedEmployeesWidget(),
            
            // Recent alerts widget
            RecentAlertsWidget(),
            
            // Scheduled drills widget
            ScheduledDrillsWidget(),
            
            // Emergency contacts widget
            EmergencyContactsWidget(),
          ],
        ),
      ),
    );
  }
}