import 'package:flutter/material.dart';
import 'package:notifi_emp/user_section/user_widgets/reportemg.dart';
import 'package:notifi_emp/user_section/user_widgets/reportuser.dart';

class ReportUserEmergCard extends StatefulWidget {
  const ReportUserEmergCard({super.key});

  @override
  State<ReportUserEmergCard> createState() => _ReportUserEmergCardState();
}

class _ReportUserEmergCardState extends State<ReportUserEmergCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
  elevation: 2,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Report Emergency Button (your existing widget or inline code)
        ReportEmergencyButton(),

       // SizedBox(height: 16), // Space between buttons

        // Report Visitor Button (with hold-to-open dialog)
        ReportVisitorButton(),
        
         Text(
            'Press and hold for 3 seconds to report an emergency',
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
      ],
    ),
  ),
)
;
  }
}