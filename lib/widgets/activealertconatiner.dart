import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/widgets/Active/overallprogress.dart';
import 'package:notifi_emp/widgets/Active/overallprogressring.dart';
 // You may need to add this package

// Main AlertContainer as previously updated
class EmergencyDashboard extends StatelessWidget {
  const EmergencyDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: orange,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Active Fire Alert',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Started: 10:45 AM',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Building A - Floor 3',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Text(
                'Ends: 11:45 AM',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.orange[500],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time Elapsed',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '00:12:45',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0:00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '1:00:00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.2,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildInfoCard(
                  'Users Notified',
                  '250',
                  Colors.white,
                  valueColor: Colors.blue,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInfoCard(
                  'Acknowledged',
                  '235',
                  Colors.white,
                  valueColor: Colors.amber,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildInfoCard(
            'Safe Reported',
            '220',
            Colors.white,
            valueColor: Colors.green,
            progressValue: 0.9,
            progressColor: Colors.green,
          ),
          const SizedBox(height: 8),
          _buildInfoCard(
            'Not Safe Reported',
            '30',
            Colors.white,
            icon: Icons.warning,
            iconColor: Colors.red,
            valueColor: Colors.red,
            progressValue: 0.12,
            progressColor: Colors.red,
          ),
          const SizedBox(height: 8),
          _buildInfoCard(
            'Total People',
            '245',
            Colors.white,
            icon: Icons.people,
            iconColor: Colors.blue,
            valueColor: Colors.blue,
          ),
          SizedBox(height: 16),
           // Overall progress doughnut chart
                  OverallProgressCard(
                    safe: 220,
                    notSafe: 30,
                    pending: 15,
                    total: 265,
                  ),
        ],
        
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, Color backgroundColor,
      {IconData? icon,
      Color? iconColor,
      double progressValue = 0.0,
      Color? progressColor,
      Color valueColor = Colors.blue}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 24,
                  ),
                ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          if (progressValue > 0.0)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(progressColor ?? Colors.green),
              ),
            )
          else
            const SizedBox.shrink(),
            
        ],
      ),
    );
  }
}

