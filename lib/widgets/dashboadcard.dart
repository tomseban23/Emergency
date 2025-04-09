import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;
  final IconData icon;
  final String? subtitle;

  const DashboardCard({
    required this.title,
    required this.value,
    this.change = '',
    required this.icon,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                // SizedBox(width: 8),
                 
                Icon(icon, color: Colors.orange),
              ],
            ),
            SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            if (change.isNotEmpty) ...[
              SizedBox(height: 8),
              Text(change, style: TextStyle(color: Colors.grey)),
            ],
            if (subtitle != null) ...[
              SizedBox(height: 8),
              Text(subtitle!, style: TextStyle(color: Colors.grey)),
            ],
          ],
        ),
      ),
    );
  }
}
