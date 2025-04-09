import 'package:flutter/material.dart';

class RecentAlertCard extends StatelessWidget {
  final String title;
  final String responded;
  final String building;
  final String safeReports;
  final String unsafeReports;
  final String responseRate; // Example: '91% (45/49 people)'
  final String date;
  final String time;

  const RecentAlertCard({
    required this.title,
    required this.responded,
    required this.building,
    required this.safeReports,
    required this.unsafeReports,
    required this.responseRate,
    required this.date,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract percentage value from responseRate string
    double responseRateValue = double.tryParse(
            responseRate.split('%')[0].trim()) ?? // Extract '91' from '91% (45/49 people)'
        0;

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Date Row with proper alignment
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        responded,
                        style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 70, // Fixed width container for date
                  child: Text(
                    date,
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 8),
            
            // Building and Time Row with proper alignment
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    building,
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
                Container(
                  width: 70, // Fixed width container for time
                  child: Text(
                    time,
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 8),
            
            // Safe/Unsafe Reports
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info, color: Colors.grey, size: 16),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Safe Reports: $safeReports | Unsafe Reports: $unsafeReports',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 8),
            
            // Response Rate
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.bar_chart, color: Colors.grey, size: 16),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'Response Rate: $responseRate',
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 8),
            
            // Progress Bar with Percentage
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    minHeight: 6,
                    value: responseRateValue / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(const Color.fromARGB(255, 143, 242, 146)),
                  ),
                ),
                SizedBox(width: 8),
                Text('${responseRate.split(' ')[0]}', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}