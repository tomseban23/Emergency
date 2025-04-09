import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifi_emp/consts/providers.dart';
import 'package:notifi_emp/screens/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:notifi_emp/screens/onboardingscreen.dart';


void main() {
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
          // home: OnboardingScreen(),
          home: DashboardPage(),
        ),
      ),
    );
  }
}
