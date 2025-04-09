// Scheduled Drills Widget
import 'dart:ui';

import 'package:flutter/material.dart';

class ScheduledDrillsWidget extends StatelessWidget {
  const ScheduledDrillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Upcoming & Scheduled Alerts',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          _buildDrillItem(
            'Monthly Fire Drill',
            'Building A - All Floors',
            'Scheduled',
            'Next Week',
            'Wed, 10:00 AM',
            Colors.amber.shade100,
          ),
          const SizedBox(height: 8),
          _buildDrillItem(
            'Security System Test',
            'All Buildings',
            'Planned',
            'Next Month',
            'May 1, 9:00 AM',
            Colors.blue.shade100,
          ),
          const SizedBox(height: 8),
          _buildDrillItem(
            'Emergency Response Training',
            'Building A & B',
            'Confirmed',
            'Next Quarter',
            'Jun 15, 2:00 PM',
            Colors.green.shade100,
          ),
        ],
      ),
    );
  }

  Widget _buildDrillItem(
    String title,
    String location,
    String status,
    String timeframe,
    String datetime,
    Color statusColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                timeframe,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                datetime,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

