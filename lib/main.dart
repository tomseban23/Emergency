import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifi_emp/admin_section/screens/activedashboard.dart';
import 'package:notifi_emp/consts/providers.dart';
import 'package:notifi_emp/admin_section/screens/dashboard.dart';
import 'package:notifi_emp/test.dart';
import 'package:notifi_emp/user_section/custombottombar.dart';
import 'package:notifi_emp/user_section/userhomecnt.dart';
import 'package:notifi_emp/user_section/userhome.dart';
import 'package:provider/provider.dart';
import 'package:notifi_emp/admin_section/screens/onboardingscreen.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // or any color you want
      statusBarIconBrightness: Brightness.light, // for dark status bar icons
      // statusBarIconBrightness: Brightness.dark, // for light status bar icons
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BusinessProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Employee Management',
          home: OnboardingScreen(),
          // home: DashboardPage(),
          // home: HomeScreen(),
                    // home: EmergencySetupPage(),

        ),
      ),
    );
  }
}
