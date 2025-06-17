import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifi_emp/admin_section/screens/dashboard.dart';

class AllowNotificationsScreen extends StatefulWidget {
  @override
  _AllowNotificationsScreenState createState() => _AllowNotificationsScreenState();
}

class _AllowNotificationsScreenState extends State<AllowNotificationsScreen> {
  bool _isEnabled = false;
  bool _canContinue = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isEnabled = value;
      _canContinue = value;
    });
    if (_isEnabled) {
      _requestNotificationPermission();
    }
  }

  Future<void> _requestNotificationPermission() async {
    // Placeholder for actual permission request logic.
  }

  void _handleContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardPage()),
    );
  }

  void _handleSkip() {
    setState(() {
      _canContinue = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("You can enable notifications later in settings.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          title: Text(
            'Enable Notifications',
            style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/bell.webp', height: 200)),
              SizedBox(height: 24),
              Text(
                'Stay informed about important alerts. Enable notifications to receive real-time updates about critical events.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
              SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue[700]),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Enable notifications to receive immediate alerts during emergencies such as fires, weather events, and more.',
                        style: TextStyle(color: Colors.blue[700], fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                  Switch(
                    value: _isEnabled,
                    onChanged: _toggleSwitch,
                    activeColor: Colors.blue[600],
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),
              Spacer(), // Pushes everything above to the top
              Center(
                child: TextButton(
                  onPressed: _handleSkip,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey[600],
                  ),
                  child: Text(
                    "Not now. I’ll enable notifications later.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _canContinue ? _handleContinue : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
                
              ),
              SizedBox(height: 10.h,)
            ],
          ),
        ),
      ),
    );
  }
}

// class NewPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),),
//         backgroundColor: Colors.blue[600],
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to Emergency App!',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
