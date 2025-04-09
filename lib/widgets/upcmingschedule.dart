import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';

class UpcomingSchedul extends StatelessWidget {
  final String title;
  final String location;
  final DateTime dateTime;
  final int participants;

  const UpcomingSchedul({
    Key? key,
    required this.title,
    required this.location,
    required this.dateTime,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container for event details
              Expanded(
                flex: 3, // Adjust flex to control space distribution
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 2, // Limit to two lines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                    const SizedBox(height: 4), // Space between title and status
                    Text(
                      '(Scheduled)',
                      style: TextStyle(
                        fontSize: 14,
                        color: orange,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(location, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8),
                    Text('${dateTime.toLocal()}', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 8),
                    Text('Expected Participants: $participants', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              const SizedBox(width: 8), // Space between details and button

              // Container for the button
              Flexible(
                flex: 1, // Adjust flex to control space distribution
                child: Container(
                  alignment: Alignment.centerRight, // Align button to the right
                  child: TextButton(
                    onPressed: () {
                      // Add your reminder action here
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: lightgrey, // Set background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Padding inside button
                    ),
                    child: Text(
                      'Remind',
                      style:
                          TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), // Button text color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
