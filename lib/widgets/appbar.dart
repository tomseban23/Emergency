import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final String actionText;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 120, // Adjust height
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.notifications, size: 24, color: orange),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(title, style: TextStyle(fontSize: 18,color: orange,fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(subtitle, style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(actionText, style: TextStyle(fontSize: 14,)),
          ),
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // Handle profile action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100); // Define height
}
