import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class EmergencyCard extends StatelessWidget {
  final List<Map<String, String>> emergencyContacts;

  const EmergencyCard({
    Key? key,
    required this.emergencyContacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        color: Colors.white,
        elevation: 4, // Add shadow to the card
        margin: const EdgeInsets.all(16.0), // Margin around the card
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display list of contacts inside the card
              ...emergencyContacts.map((contact) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            contact['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            contact['subtitle']!,
                            style:
                                TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final Uri phoneUri =
                              Uri(scheme: 'tel', path: contact['phoneNumber']);
                          if (await canLaunch(phoneUri.toString())) {
                            await launch(phoneUri.toString());
                          } else {
                            print('Cannot launch phone dialer.');
                          }
                        },
                        icon: const Icon(Icons.phone_enabled,color: Colors.white,),
                        label: const Text('Call',style: TextStyle(fontWeight: FontWeight.bold),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              orange, // Example button color
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
