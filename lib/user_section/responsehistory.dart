import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/user_section/user_widgets/historyitem.dart';
import 'package:notifi_emp/user_section/userhomecnt.dart';

class ResponseHistorySection extends StatelessWidget {
  const ResponseHistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: lightgrey,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.history, color: Colors.grey[700], size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Response History',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.amber[400],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.amber[400], size: 18),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Fire Alert History Item
          const HistoryItem(
            alertType: 'Fire Alert',
            alertColor: Colors.red,
            alertIcon: Icons.local_fire_department,
            statusType: 'Reported Safe',
            statusColor: Colors.green,
            statusIcon: Icons.shield_outlined,
            time: '10:30 AM',
            statusTime: '10:32 AM',
            location: 'Assembly Point C',
          ),
          
          const Divider(height: 30,thickness: 0.3,),
          
          // Gas Leak Warning History Item
          const HistoryItem(
            alertType: 'Gas Leak Warning',
            alertColor: Colors.amber,
            alertIcon: Icons.warning_amber_outlined,
            statusType: 'Help Needed',
            statusColor: Colors.amber,
            statusIcon: Icons.warning_amber_outlined,
            time: '9:15 AM',
            statusTime: '9:18 AM',
            location: 'Chemical Lab - Section B',
          ),
          
          const Divider(height: 30,thickness: 0.3),
          
          // Safety Drill History Item
          const HistoryItem(
            alertType: 'Safety Drill',
            alertColor: Colors.blue,
            alertIcon: Icons.timer_outlined,
            statusType: 'Reported Safe',
            statusColor: Colors.green,
            statusIcon: Icons.shield_outlined,
            time: '8:30 AM',
            statusTime: '8:35 AM',
            location: 'Emergency Exit B',
          ),
          
          const Divider(height: 30,thickness: 0.3),
          
          // Chemical Spill Alert History Item
          HistoryItem(
            alertType: 'Chemical Spill Alert',
            alertColor: Colors.orange,
            alertIcon: Icons.science_outlined,
            statusType: 'Not Safe',
            statusColor: Colors.red,
            statusIcon: Icons.cancel_outlined,
            time: 'Yesterday, 4:15 PM',
            statusTime: 'Yesterday, 4:20 PM',
            location: 'Storage Room 2B',
          ),
          
          const Divider(height: 30,thickness: 0.3),
          
          // Equipment Malfunction History Item
          const HistoryItem(
            alertType: 'Equipment Malfunction',
            alertColor: Colors.purple,
            alertIcon: Icons.build_outlined,
            statusType: 'Reported Safe',
            statusColor: Colors.green,
            statusIcon: Icons.shield_outlined,
            time: 'Yesterday, 2:30 PM',
            statusTime: 'Yesterday, 2:45 PM',
            location: 'Maintenance Bay',
          ),
        ],
      ),
    );
  }
}
