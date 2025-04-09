import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:notifi_emp/consts/consts.dart';

class NewAlertPage extends StatefulWidget {
  const NewAlertPage({Key? key}) : super(key: key);

  @override
  State<NewAlertPage> createState() => _NewAlertPageState();
}

class _NewAlertPageState extends State<NewAlertPage> {
  String? selectedAlertType;
  DateTime? startDate;
  TimeOfDay? startTime;
  DateTime? endDate;
  TimeOfDay? endTime;
  TextEditingController messageController = TextEditingController();
  String? selectedRegion;
  String? selectedCity;
  String durationText = "0 hours"; // Default duration text
  
  List<String> alertTypes = ['Emergency', 'Weather', 'Traffic', 'Event', 'Other'];
  List<String> regions = ['North', 'South', 'East', 'West', 'Central'];
  List<String> cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'];

  // This function updates the duration based on the selected start and end date/time
  void _updateDuration() {
    if (startDate != null && startTime != null && endDate != null && endTime != null) {
      final start = DateTime(
        startDate!.year,
        startDate!.month,
        startDate!.day,
        startTime!.hour,
        startTime!.minute,
      );
      
      final end = DateTime(
        endDate!.year,
        endDate!.month,
        endDate!.day,
        endTime!.hour,
        endTime!.minute,
      );
      
      final difference = end.difference(start);
      
      final days = difference.inDays;
      final hours = difference.inHours.remainder(24);
      final minutes = difference.inMinutes.remainder(60);
      
      setState(() {
        if (days > 0) {
          durationText = '$days days, $hours hours, $minutes minutes';
        } else if (hours > 0) {
          durationText = '$hours hours, $minutes minutes';
        } else {
          durationText = '$minutes minutes';
        }
      });
    } else {
      setState(() {
        durationText = "0 hours";
      });
    }
  }

  // Function to send a POST request to the backend
  Future<void> _sendAlert() async {
    final String url = 'https://your-api-endpoint.com/alerts'; // Replace with your actual backend URL

    try {
      // Create the alert data
      final Map<String, dynamic> alertData = {
        'alertType': selectedAlertType,
        'message': messageController.text,
        'startDate': '${DateFormat('yyyy-MM-dd').format(startDate!)} ${startTime!.format(context)}',
        'endDate': '${DateFormat('yyyy-MM-dd').format(endDate!)} ${endTime!.format(context)}',
        'region': selectedRegion,
        'city': selectedCity,
        'duration': durationText,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(alertData),
      );

      if (response.statusCode == 200) {
        // Alert successfully created
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alert sent successfully!')));
      } else {
        // Error response
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to send alert')));
      }
    } catch (e) {
      // Catch any error during the HTTP request
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey2,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('New Alert', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              // Alert Type Card
              Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alert Type',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            border: InputBorder.none,
                          ),
                          hint: const Text('Select Alert Type'),
                          value: selectedAlertType,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: alertTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAlertType = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Message Card
              Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Message',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: messageController,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Enter alert message...',
                            contentPadding: EdgeInsets.all(16),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Alert Duration Card
              Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alert Duration',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          // Start Date & Time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Start Time',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                InkWell(
                                  onTap: () async {
                                    final DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: startDate ?? DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickedDate != null) {
                                      setState(() {
                                        startDate = pickedDate;
                                      });
                                      
                                      // Show time picker after date is selected
                                      final TimeOfDay? pickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: startTime ?? TimeOfDay.now(),
                                      );
                                      if (pickedTime != null) {
                                        setState(() {
                                          startTime = pickedTime;
                                        });
                                        _updateDuration();
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            (startDate == null || startTime == null)
                                                ? 'mm/dd/yyyy hh:mm'
                                                : '${DateFormat('MM/dd/yyyy').format(startDate!)} ${startTime!.format(context)}',
                                            style: TextStyle(
                                              color: (startDate == null || startTime == null) ? Colors.grey : Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Icon(Icons.calendar_today, size: 18),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          // End Date & Time
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'End Time',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                InkWell(
                                  onTap: () async {
                                    final DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: endDate ?? (startDate ?? DateTime.now()).add(const Duration(days: 1)),
                                      firstDate: startDate ?? DateTime.now(),
                                      lastDate: DateTime(2101),
                                    );
                                    if (pickedDate != null) {
                                      setState(() {
                                        endDate = pickedDate;
                                      });
                                      
                                      // Show time picker after date is selected
                                      final TimeOfDay? pickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: endTime ?? TimeOfDay.now(),
                                      );
                                      if (pickedTime != null) {
                                        setState(() {
                                          endTime = pickedTime;
                                        });
                                        _updateDuration();
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            (endDate == null || endTime == null)
                                                ? 'mm/dd/yyyy hh:mm'
                                                : '${DateFormat('MM/dd/yyyy').format(endDate!)} ${endTime!.format(context)}',
                                            style: TextStyle(
                                              color: (endDate == null || endTime == null) ? Colors.grey : Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const Icon(Icons.calendar_today, size: 18),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Location Card
              Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                  border: InputBorder.none,
                                ),
                                hint: const Text('Select Region'),
                                value: selectedRegion,
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: regions.map((String region) {
                                  return DropdownMenuItem<String>(
                                    value: region,
                                    child: Text(region),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedRegion = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                                  border: InputBorder.none,
                                ),
                                hint: const Text('Select City'),
                                value: selectedCity,
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: cities.map((String city) {
                                  return DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCity = newValue;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Call backend API to send alert
                        _sendAlert();
                      },
                      icon: const Icon(Icons.campaign, color: Colors.white),
                      label: const Text('Broadcast Alert'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD38B4F),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Schedule alert logic (if needed)
                      },
                      icon: const Icon(Icons.schedule, color: Colors.grey),
                      label: const Text('Schedule Alert'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black54,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
