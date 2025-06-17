import 'package:flutter/material.dart';

class SafetyIncidentCard extends StatelessWidget {
  const SafetyIncidentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Safety Incidents',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Incident List
            _IncidentItem(
              color: Colors.green,
              title: 'Minor Equipment Malfunction',
              date: 'May 15, 2025 - Production Floor',
              status: 'Resolved',
              statusColor: Colors.greenAccent,
              description: 'Conveyor belt sensor malfunction caused brief stoppage. Maintenance team repaired within 30 minutes. No injuries reported.',
            ),
            const Divider(),
            _IncidentItem(
              color: Colors.amber,
              title: 'Near Miss - Slip Hazard',
              date: 'May 10, 2025 - Break Room',
              status: 'Addressed',
              statusColor: Colors.yellow[300]!,
              description: 'Water spill near refrigerator created slip hazard. Cleaned immediately after report. Floor mats installed as preventive measure.',
            ),
            const Divider(),
            _IncidentItem(
              color: Colors.red,
              title: 'Minor Chemical Exposure',
              date: 'May 5, 2025 - Lab Area',
              status: 'Investigated',
              statusColor: Colors.red[200]!,
              description: 'Employee experienced minor skin irritation from cleaning solution. First aid provided. Additional PPE training conducted for all lab personnel.',
            ),
            const Divider(),
            _IncidentItem(
              color: Colors.grey,
              title: 'Fire Alarm Activation',
              date: 'April 28, 2025 - Server Room',
              status: 'False Alarm',
              statusColor: Colors.grey[300]!,
              description: 'Dust triggered smoke detector during routine maintenance. Evacuation completed in 3.5 minutes. System reset after verification.',
            ),
          ],
        ),
      ),
    );
  }
}

class _IncidentItem extends StatelessWidget {
  final Color color;
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final String description;

  const _IncidentItem({
    required this.color,
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Dot
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 16),
        // Incident Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Status
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(fontSize: 13, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
