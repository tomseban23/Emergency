import 'package:flutter/material.dart';
import 'package:notifi_emp/admin_section/screens/employeepage.dart';
import 'package:notifi_emp/user_section/custombottombar.dart';
import 'package:notifi_emp/user_section/responsehistory.dart';
import 'package:notifi_emp/user_section/user_widgets/activealertcard.dart';
import 'package:notifi_emp/user_section/user_widgets/custappbar.dart';
import 'package:notifi_emp/user_section/user_widgets/emercontactlist.dart';
import 'package:notifi_emp/user_section/user_widgets/notificard.dart';
import 'package:notifi_emp/user_section/user_widgets/org_info.dart';
import 'package:notifi_emp/user_section/user_widgets/quickaction.dart';
import 'package:notifi_emp/user_section/user_widgets/reportemg.dart';
import 'package:notifi_emp/user_section/user_widgets/reportemg_usercard.dart';
import 'package:notifi_emp/user_section/user_widgets/reportuser.dart';
import 'package:notifi_emp/user_section/user_widgets/statusinfocard.dart';
import 'package:notifi_emp/user_section/user_widgets/userstatuscard.dart';
import 'package:notifi_emp/widgets/appbar.dart';


class UserHomeCnt extends StatelessWidget {
  const UserHomeCnt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            
            // App Bar
            // CustomUserAppBar(),
            // SizedBox(height: 20,),
            
            // Main Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  // Active Alert Card
                  const ActiveAlertCard(
                    alertType: 'Fire Alert',
                    location: 'Building C - Floor 4',
                    message: 'Fire detected in Building B, Floor 2. Evacuate immediately using emergency exits. Proceed to assembly point C.',
                    time: '2:30 PM',
                    countdownSeconds: 212, 
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // User Status Card
                  const UserStatusCard(
                    name: 'Aswin',
                    department: 'Production - Floor 6',
                    isSafe: true,
                    lastUpdated: '10 hrs ago',
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Status Info Cards
                  Row(
                    children: [
                      // Last Safe Check Card
                      Expanded(
                        child: StatusInfoCard(
                          icon: Icons.shield_outlined,
                          iconColor: Colors.green[700]!,
                          title: 'Last Safe Check',
                          subtitle: 'Today, 10:32 AM',
                          backgroundColor: Colors.green[50]!,
                        ),
                      ),
                      
                      const SizedBox(width: 10),
                      
                      // Last Alert Card
                      Expanded(
                        child: StatusInfoCard(
                          icon: Icons.notifications_none,
                          iconColor: Colors.blue[700]!,
                          title: 'Last Alert',
                          subtitle: 'Fire Alert - 10:30 AM',
                          backgroundColor: Colors.blue[50]!,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Response History Section
                  const ResponseHistorySection(),
                  SizedBox(height: 16),
                QuickActions(),
                   SizedBox(height: 16),
                   OrganizationInfoCard(),
                
                   SizedBox(height: 16),

                RecentNotificationsCard(),
                SizedBox(height: 16),
                ReportUserEmergCard(),
               // ReportEmergencyButton(),
                // ReportVisitorButton(),
               // SizedBox(height: 20),
                EmergencyContactsPage(),
                ],
              ),
            ),
            
            // Bottom Navigation Bar
           // const CustomBottomNavigationBar(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.notifications, color: Colors.white),
      ),
    );
  }
}



