import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final String alertType;
  final Color alertColor;
  final IconData alertIcon;
  final String statusType;
  final Color statusColor;
  final IconData statusIcon;
  final String time;
  final String statusTime;
  final String location;

  const HistoryItem({
    Key? key,
    required this.alertType,
    required this.alertColor,
    required this.alertIcon,
    required this.statusType,
    required this.statusColor,
    required this.statusIcon,
    required this.time,
    required this.statusTime,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Alert Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: alertColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  alertType,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: alertColor,
                  ),
                ),
              ],
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                 fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 8),
        
        // Status Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 18),
                Icon(
                  statusIcon,
                  color: statusColor,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Container(
                 // color: statusColor.withOpacity(0.1),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    statusType,
                    style: TextStyle(
                      fontSize: 14,
                      color: statusColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              statusTime,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 4),
        
        // Location Row
        if (location.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              'Location: $location',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500],
              ),
            ),
          ),
      ],
    );
  }
}
