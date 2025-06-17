import 'package:flutter/material.dart';
import 'package:notifi_emp/user_section/user_widgets/containersafty.dart';
import 'package:notifi_emp/user_section/user_widgets/safteyemgcontact.dart';
import 'package:notifi_emp/user_section/user_widgets/safteyincidentcard.dart';
import 'package:notifi_emp/user_section/user_widgets/saftyprotocolcard.dart';

class Saftypage extends StatefulWidget {
  const Saftypage({super.key});

  @override
  State<Saftypage> createState() => _SaftypageState();
}

class _SaftypageState extends State<Saftypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 0),
        children: [
          SafetyProtocolsCard(),
         // SizedBox(height: 20),
          EmergencyContactsCard(),
          SafetyIncidentCard(),
          SafetyDashboardScreen(),
        ],
      ),
    );
  }
}
