import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsPage extends StatelessWidget {
  const EmergencyContactsPage({Key? key}) : super(key: key);

  // Function to launch the phone dialer
  void _callNumber(BuildContext context, String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch dialer for $phoneNumber')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          EmergencyCard(
            title: "Emergency Coordinator",
            subtitle: "James Wilson",
            phone: "+1 (555) 123-4567",
            buttonText: "Call Now",
            onTap: () => _callNumber(context, "+1 (555) 123-4567"),
          ),
          EmergencyCard(
            title: "Facility Security",
            subtitle: "Security Control Room",
            phone: "+1 (555) 123-4568",
            buttonText: "Call Now",
            onTap: () => _callNumber(context, "+1 (555) 123-4568"),
          ),
          EmergencyCard(
            title: "Medical Team",
            subtitle: "On-site Medical Unit",
            phone: "+1 (555) 123-4569",
            buttonText: "Call Now",
            onTap: () => _callNumber(context, "+1 (555) 123-4569"),
          ),
          ExternalEmergencyCard(
            title: "External Emergency Services",
            subtitle: "Police, Fire, Ambulance",
            phone: "911",
            buttonText: "Call 911",
            onTap: () => _callNumber(context, "911"),
          ),
        ],
      ),
    );
  }
}

class EmergencyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String phone;
  final String buttonText;
  final VoidCallback onTap;

  const EmergencyCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.phone,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                )),
            const SizedBox(height: 2),
            Text(phone,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                )),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onTap,
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExternalEmergencyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String phone;
  final String buttonText;
  final VoidCallback onTap;

  const ExternalEmergencyCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.phone,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFDE9EA),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.red[300]!, width: 2),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.red[700],
                )),
            const SizedBox(height: 4),
            Text(subtitle,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 15,
                )),
            Text(phone,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 15,
                )),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: onTap,
                child: Text(
                  buttonText,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
