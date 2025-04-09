// Progress Doughnut Chart Widget for Overall Progress
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notifi_emp/widgets/Active/overallprogressring.dart';

class OverallProgressCard extends StatelessWidget {
  final int safe;
  final int notSafe;
  final int pending;
  final int total;

  const OverallProgressCard({
    Key? key,
    required this.safe,
    required this.notSafe,
    required this.pending,
    required this.total,
  }) : super(key: key);

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
          const Text(
            'Overall Progress',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // This is a placeholder for the actual doughnut chart
                // In a real app, you would use a chart library like fl_chart or syncfusion_flutter_charts
                CustomPaint(
                  size: const Size(140, 140),
                  painter: DoughnutChartPainter(
                    safe: safe / total,
                    notSafe: notSafe / total,
                    pending: pending / total,
                  ),
                ),
                Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  child: Text(
                    'Pending: ${pending.toString()} (${(pending / total * 100).toStringAsFixed(2)}%)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 5,
                  child: Text(
                    'Not Safe: ${notSafe.toString()} (${(notSafe / total * 100).toStringAsFixed(2)}%)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Text(
                    'Safe: ${safe.toString()} (${(safe / total * 100).toStringAsFixed(2)}%)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

