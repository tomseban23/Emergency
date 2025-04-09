// Recently Updated Employees Widget
import 'dart:ui';

import 'package:flutter/material.dart';

class RecentlyUpdatedEmployeesWidget extends StatelessWidget {
  const RecentlyUpdatedEmployeesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Recently Updated Employees',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text('View all employees\' status',
                  style: TextStyle(color: Colors.grey)),
              Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _buildEmployeeItem(
          'John Smith',
          'Floor 3',
          'Safe',
          '2 mins ago',
          Colors.green,
        ),
        const SizedBox(height: 8),
        _buildEmployeeItem(
          'Sarah Johnson',
          'Floor 3',
          'Not Safe',
          '5 mins ago',
          Colors.red,
        ),
        const SizedBox(height: 8),
        _buildEmployeeItem(
          'Mike Davis',
          'Floor 3',
          'Pending',
          '8 mins ago',
          Colors.amber,
        ),
      ],
    );
  }

  Widget _buildEmployeeItem(
    String name,
    String location,
    String status,
    String time,
    Color statusColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.chat_bubble,
                color: Colors.orange,
                size: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

