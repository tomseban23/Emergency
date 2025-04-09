import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/api.dart';
import 'package:notifi_emp/widgets/dashboadcard.dart';
import 'package:notifi_emp/widgets/emgcontact.dart';
import 'package:notifi_emp/widgets/horizontalbuttons.dart';
import 'package:notifi_emp/widgets/recentalertcard.dart';
import 'package:notifi_emp/widgets/upcmingschedule.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';

class DashboardContent extends StatefulWidget {
  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  String selectedBuilding = 'Building A';
  List<DashboardCardModel>? _dashboardCards;
  List<RecentAlertModel>? _recentAlerts;
  List<UpcomingScheduleModel>? _upcomingSchedules;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final apiService = ApiService();
    try {
      final dashboardCards = await apiService.getDashboardData();
      final recentAlerts = await apiService.getRecentAlerts();
      final upcomingSchedules = await apiService.getUpcomingSchedules();

      setState(() {
        _dashboardCards = dashboardCards;
        _recentAlerts = recentAlerts;
        _upcomingSchedules = upcomingSchedules;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Handle new alert action
              },
              icon: Icon(Icons.add),
              label: Text('New Alert'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.orange,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text('Map with "No Active Alerts"'),
              ),
            ),
            HorizontalButtonRow(),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search alerts...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            if (_dashboardCards != null)
              Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: _dashboardCards![0].title,
                            value: _dashboardCards![0].value,
                            change: _dashboardCards![0].change,
                            icon: _dashboardCards![0].icon,
                            subtitle: _dashboardCards![0].subtitle,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: DashboardCard(
                            title: _dashboardCards![1].title,
                            value: _dashboardCards![1].value,
                            change: _dashboardCards![1].change,
                            icon: _dashboardCards![1].icon,
                            subtitle: _dashboardCards![1].subtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: _dashboardCards![2].title,
                            value: _dashboardCards![2].value,
                            change: _dashboardCards![2].change,
                            icon: _dashboardCards![2].icon,
                            subtitle: _dashboardCards![2].subtitle,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: DashboardCard(
                            title: _dashboardCards![3].title,
                            value: _dashboardCards![3].value,
                            change: _dashboardCards![3].change,
                            icon: _dashboardCards![3].icon,
                            subtitle: _dashboardCards![3].subtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            title: _dashboardCards![4].title,
                            icon: _dashboardCards![4].icon,
                            value: _dashboardCards![4].value,
                            subtitle: _dashboardCards![4].subtitle,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: DashboardCard(
                            title: _dashboardCards![5].title,
                            icon: _dashboardCards![5].icon,
                            value: _dashboardCards![5].value,
                            subtitle: _dashboardCards![5].subtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 120,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 120,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 120,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

            SizedBox(height: 16),
            BuildingSelector(
              buildings: ['Building A', 'Building B', 'Building C', 'Building D'],
              onBuildingSelected: (building) {
                setState(() {
                  selectedBuilding = building;
                  // You can perform other actions when a building is selected
                });
              },
              initialSelection: selectedBuilding,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Recent Alerts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 10,),
                TextButton(
                  onPressed: () {},
                  child: Text('View all',style: TextStyle(color: Colors.grey),),
                ),
              ],
            ),
            SizedBox(height: 8),

            if (_recentAlerts != null)
              RecentAlertCard(
                title: _recentAlerts![0].title,
                responded: _recentAlerts![0].responded,
                building: _recentAlerts![0].building,
                safeReports: _recentAlerts![0].safeReports,
                unsafeReports: _recentAlerts![0].unsafeReports,
                responseRate: _recentAlerts![0].responseRate,
                date: _recentAlerts![0].date,
                time: _recentAlerts![0].time,
              )
            else
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 200,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

            SizedBox(height: 10),
            Center(child: Text('Upcoming & Scheduled Alerts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            if (_upcomingSchedules != null)
              UpcomingSchedul(
                title: _upcomingSchedules![0].title,
                location: _upcomingSchedules![0].location,
                dateTime: _upcomingSchedules![0].dateTime,
                participants: _upcomingSchedules![0].participants,
              )
            else
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 150,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            Center(child: Text('Emergency Contacts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            EmergencyCard(
              emergencyContacts: [
                {
                  'title': 'Security Office',
                  'subtitle': '24/7 Emergency',
                  'phoneNumber': '+15551234567',
                },
                {
                  'title': 'Medical Response',
                  'subtitle': 'First Aid Team',
                  'phoneNumber': '+15551234568',
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
