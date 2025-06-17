// Notification Preferences Card Widget
import 'package:flutter/material.dart';

class NotificationPreferencesCard extends StatefulWidget {
  const NotificationPreferencesCard({Key? key}) : super(key: key);

  @override
  State<NotificationPreferencesCard> createState() => _NotificationPreferencesCardState();
}

class _NotificationPreferencesCardState extends State<NotificationPreferencesCard> {
  bool emergencyAlerts = true;
  bool safetyWarnings = true;
  bool generalUpdates = false;
  bool certificationReminders = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notification Preferences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          NotificationToggleTile(
            icon: Icons.warning_amber_outlined,
            iconColor: Colors.red,
            iconBackgroundColor: Colors.red[50]!,
            title: 'Emergency Alerts',
            subtitle: 'Fire, gas leaks, evacuations',
            value: emergencyAlerts,
            onChanged: (value) {
              setState(() {
                emergencyAlerts = value;
              });
            },
          ),
          NotificationToggleTile(
            icon: Icons.warning_outlined,
            iconColor: Colors.orange,
            iconBackgroundColor: Colors.orange[50]!,
            title: 'Safety Warnings',
            subtitle: 'Equipment issues, hazards',
            value: safetyWarnings,
            onChanged: (value) {
              setState(() {
                safetyWarnings = value;
              });
            },
          ),
          NotificationToggleTile(
            icon: Icons.info_outline,
            iconColor: Colors.indigoAccent,
            iconBackgroundColor: Colors.indigoAccent[100]!,
            title: 'General Updates',
            subtitle: 'Training, meetings, news',
            value: generalUpdates,
            onChanged: (value) {
              setState(() {
                generalUpdates = value;
              });
            },
          ),
          NotificationToggleTile(
            icon: Icons.verified_outlined,
            iconColor: Colors.green,
            iconBackgroundColor: Colors.green[50]!,
            title: 'Certification Reminders',
            subtitle: 'Renewals, expirations',
            value: certificationReminders,
            onChanged: (value) {
              setState(() {
                certificationReminders = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// Notification Toggle Tile Widget
class NotificationToggleTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationToggleTile({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.indigoAccent,
          ),
        ],
      ),
    );
  }
}