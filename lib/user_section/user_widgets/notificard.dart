// Notification Data Model
import 'package:flutter/material.dart';

class NotificationItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String time;
  final String status;
  final Color statusColor;

  NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.time,
    required this.status,
    required this.statusColor,
  });
}

// Recent Notifications Widget
class RecentNotificationsCard extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      icon: Icons.local_fire_department,
      iconColor: Colors.red,
      title: 'Fire Alert',
      time: 'Today, 10:30 AM',
      status: 'Active',
      statusColor: Colors.redAccent,
    ),
    NotificationItem(
      icon: Icons.warning_amber_rounded,
      iconColor: Colors.amber,
      title: 'Gas Leak Warning',
      time: 'Today, 9:15 AM',
      status: 'Resolved',
      statusColor: Colors.grey,
    ),
    NotificationItem(
      icon: Icons.shield,
      iconColor: Colors.blue,
      title: 'Safety Drill',
      time: 'Yesterday, 2:30 PM',
      status: 'Resolved',
      statusColor: Colors.grey,
    ),
  ];

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
            Row(
              children: [
                Text('Recent Notifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Spacer(),
                Text('View All', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 12),
            ...notifications.map((n) => NotificationTile(item: n)).toList(),
          ],
        ),
      ),
    );
  }
}

// Notification Tile Widget
class NotificationTile extends StatelessWidget {
  final NotificationItem item;
  NotificationTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: item.iconColor.withOpacity(0.15),
            child: Icon(item.icon, color: item.iconColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: TextStyle(fontWeight: FontWeight.w600, color: item.iconColor)),
                Text(item.time, style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: item.statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(item.status, style: TextStyle(color: item.statusColor, fontWeight: FontWeight.w500, fontSize: 13)),
          ),
        ],
      ),
    );
  }
}