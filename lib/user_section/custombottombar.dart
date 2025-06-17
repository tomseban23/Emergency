import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            icon: Icons.home_outlined,
            label: 'Home',
            isActive: true,
            color: Colors.amber[400]!,
          ),
          NavBarItem(
            icon: Icons.shield_outlined,
            label: 'Safety',
            isActive: false,
            color: Colors.grey[400]!,
          ),
          NavBarItem(
            icon: Icons.chat_bubble_outline,
            label: 'Messages',
            isActive: false,
            color: Colors.grey[400]!,
          ),
          NavBarItem(
            icon: Icons.person_outline,
            label: 'Profile',
            isActive: false,
            color: Colors.grey[400]!,
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color color;

  const NavBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 22,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}