// Organization Info Widget
import 'dart:ui';

import 'package:flutter/material.dart';

class OrganizationInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Organization Info', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.apartment, color: Colors.grey[600]),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chemical Plant - Building B', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('123 Industrial Avenue, Floor 2', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.person_pin, color: Colors.grey[600]),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Emergency Coordinator', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('James Wilson', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Text('+1 (555) 123-4567', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}