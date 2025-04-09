// api_service.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:notifi_emp/consts/consts.dart';

class ApiService {

// bussiness name

  static Future<void> checkBusinessName(String businessName) async {
    try {
      final url = Uri.parse('$BaseUrl/checkBusinessName');
      print('Sending request to: $url');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'businessName': businessName}),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response data: $responseData');
        return responseData;
      } else {
        print('Error: ${response.body}');
        throw Exception('Failed to check business name');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Error occurred while validating business name');
    }
  }


  //new alert (alert types)

    Future<List<String>> fetchAlertTypes() async {
    final response = await http.get(Uri.parse('$BaseUrl/alert-types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load alert types');
    }
  }

  //new alert(to send data)

  Future<void> createAlert(Map<String, dynamic> alertData) async {
    final response = await http.post(
      Uri.parse('$BaseUrl/alerts'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(alertData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create alert');
    }
  }

//dashboard card

  Future<List<DashboardCardModel>> getDashboardData() async {
    final url = Uri.parse('$BaseUrl/dashboard');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((data) => DashboardCardModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<RecentAlertModel>> getRecentAlerts() async {
    final url = Uri.parse('$BaseUrl/recent-alerts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((data) => RecentAlertModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UpcomingScheduleModel>> getUpcomingSchedules() async {
    final url = Uri.parse('$BaseUrl/upcoming-schedules');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData.map((data) => UpcomingScheduleModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class DashboardCardModel {
  final String title;
  final String value;
  final String change;
  final IconData icon;
  final String? subtitle;

  DashboardCardModel({
    required this.title,
    required this.value,
    required this.change,
    required this.icon,
    this.subtitle,
  });

  factory DashboardCardModel.fromJson(Map<String, dynamic> json) {
    return DashboardCardModel(
      title: json['title'],
      value: json['value'],
      change: json['change'],
      icon: _getIcon(json['icon']), // Assuming icon is a string
      subtitle: json['subtitle'],
    );
  }

  static IconData _getIcon(String iconStr) {
    // Implement logic to convert string to IconData
    // For simplicity, let's assume 'notifications' maps to Icons.notifications
    if (iconStr == 'notifications') return Icons.notifications;
    // Add more mappings as needed
    return Icons.info; // Default icon
  }
}

class RecentAlertModel {
  final String title;
  final String responded;
  final String building;
  final String safeReports;
  final String unsafeReports;
  final String responseRate;
  final String date;
  final String time;

  RecentAlertModel({
    required this.title,
    required this.responded,
    required this.building,
    required this.safeReports,
    required this.unsafeReports,
    required this.responseRate,
    required this.date,
    required this.time,
  });

  factory RecentAlertModel.fromJson(Map<String, dynamic> json) {
    return RecentAlertModel(
      title: json['title'],
      responded: json['responded'],
      building: json['building'],
      safeReports: json['safeReports'],
      unsafeReports: json['unsafeReports'],
      responseRate: json['responseRate'],
      date: json['date'],
      time: json['time'],
    );
  }
}

class UpcomingScheduleModel {
  final String title;
  final String location;
  final DateTime dateTime;
  final int participants;

  UpcomingScheduleModel({
    required this.title,
    required this.location,
    required this.dateTime,
    required this.participants,
  });

  factory UpcomingScheduleModel.fromJson(Map<String, dynamic> json) {
    return UpcomingScheduleModel(
      title: json['title'],
      location: json['location'],
      dateTime: DateTime.parse(json['dateTime']), // Assuming date is in ISO format
      participants: json['participants'],
    );
  }
}
