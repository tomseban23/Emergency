import 'package:flutter/material.dart';


class SafetyDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            physics: NeverScrollableScrollPhysics(), 
            shrinkWrap: true,
            children: [
              _DashboardCard(
                color: Color(0xFFFFF2F2),
                icon: Icons.notifications_active,
                iconColor: Colors.red[400],
                label: 'Report Emergency',
                labelColor: Colors.red[700],
              ),
              _DashboardCard(
                color: Color(0xFFF2F7FF),
                icon: Icons.alt_route,
                iconColor: Colors.blue[400],
                label: 'Evacuation Route',
                labelColor: Colors.blue[700],
              ),
              _DashboardCard(
                color: Color(0xFFF2FFF7),
                icon: Icons.verified_user,
                iconColor: Colors.green[400],
                label: 'Contact Safety Officer',
                labelColor: Colors.green[700],
              ),
              _DashboardCard(
                color: Color(0xFFF7F2FF),
                icon: Icons.menu_book,
                iconColor: Colors.purple[400],
                label: 'Safety Manual',
                labelColor: Colors.purple[700],
              ),
            ],
          ),
        );
  }
}

class _DashboardCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color? iconColor;
  final String label;
  final Color? labelColor;

  const _DashboardCard({
    required this.color,
    required this.icon,
    this.iconColor,
    required this.label,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: iconColor),
              SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: labelColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
