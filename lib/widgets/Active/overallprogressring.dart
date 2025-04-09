// Custom painter for doughnut chart
import 'package:flutter/material.dart';

class DoughnutChartPainter extends CustomPainter {
  final double safe;
  final double notSafe;
  final double pending;

  DoughnutChartPainter({
    required this.safe,
    required this.notSafe,
    required this.pending,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint safeArc = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    
    final Paint notSafeArc = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    
    final Paint pendingArc = Paint()
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2 - 10,
    );

    // Draw the safe arc
    canvas.drawArc(
      rect,
      0,
      2 * 3.14 * safe,
      false,
      safeArc,
    );

    // Draw the not safe arc
    canvas.drawArc(
      rect,
      2 * 3.14 * safe,
      2 * 3.14 * notSafe,
      false,
      notSafeArc,
    );

    // Draw the pending arc
    canvas.drawArc(
      rect,
      2 * 3.14 * (safe + notSafe),
      2 * 3.14 * pending,
      false,
      pendingArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

