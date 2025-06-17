import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsCard extends StatelessWidget {
  // Helper to launch phone calls
  void _callNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      // Handle error
      print('Could not launch $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Emergency Contacts',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22)),
            SizedBox(height: 16),
            // Emergency Services
            _contactTile(
              context,
              color: Colors.red[50]!,
              icon: Icons.local_phone,
              title: 'Emergency Services',
              subtitle: '911',
              buttonColor: Colors.red,
              onPressed: () => _callNumber('911'),
            ),
            SizedBox(height: 12),
            // Safety Officer
            _contactTile(
              context,
              color: lightgrey,
              icon: Icons.shield,
              title: 'Safety Officer',
              subtitle: 'Jennifer Martinez - Ext. 4567',
              buttonColor: Colors.blue,
              onPressed: () => _callNumber('4567'),
            ),
            SizedBox(height: 12),
            // Medical Response
            _contactTile(
              context,
              color: lightgrey,
              icon: Icons.health_and_safety,
              title: 'Medical Response',
              subtitle: 'Dr. Robert Chen - Ext. 3210',
              buttonColor: Colors.blue,
              onPressed: () => _callNumber('3210'),
            ),
            SizedBox(height: 12),
            // Fire Department
            _contactTile(
              context,
              color: lightgrey,
              icon: Icons.local_fire_department,
              title: 'Fire Department',
              subtitle: 'Non-emergency: (555) 789-4567',
              buttonColor: Colors.amber[700]!,
              onPressed: () => _callNumber('5557894567'),
            ),
            SizedBox(height: 12),
            // Facility Manager
            _contactTile(
              context,
              color: lightgrey,
              icon: Icons.business,
              title: 'Facility Manager',
              subtitle: 'Thomas Wilson - Ext. 2345',
              buttonColor: Colors.green,
              onPressed: () => _callNumber('2345'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactTile(
    BuildContext context, {
    required Color color,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color buttonColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          Icon(icon, color: buttonColor, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 2),
                Text(subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700])),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.phone, color: Colors.white),
            onPressed: onPressed,
            color: buttonColor,
            iconSize: 28,
            padding: EdgeInsets.all(12),
            splashRadius: 24,
            constraints: BoxConstraints(),
            style: IconButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
