import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifi_emp/screens/bussinessname.dart';
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/screens/signin.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              // Title Section
              Padding(
                padding: EdgeInsets.only(top: 140.h),
                child: Column(
                  children: [
                    Container(padding: EdgeInsets.all(25.r),
                      decoration:BoxDecoration(shape: BoxShape.circle,color:Colors.grey.withOpacity(0.1),),
                    child:  Icon(Icons.notifications, size: 60.r, color: orange)),
                    SizedBox(height: 10.h),
                    Text(
                      'Emertify',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Your trusted partner for emergency \nalerts and safety management',
                      style: TextStyle(fontSize: 16.sp, color: Colors.black54,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // Buttons Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Business Name screen
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessName()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orange,
                          foregroundColor: Colors.white,
                          padding:
                              EdgeInsets.symmetric(vertical: 15.h, ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text('Get Started', style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w800)),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to next screen
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding:
                              EdgeInsets.symmetric(vertical: 15.h, ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                               side: BorderSide(color: Colors.grey, width: .5.w
                          ),
                          ),
                        ),
                        child: Text('Sign In', style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ],
                ),
              ),

              // Icons Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconWithLabel(Icons.notifications, 'Instant\nAlerts'),
                  _buildIconWithLabel(Icons.location_on, 'Location\nTracking'),
                  _buildIconWithLabel(Icons.phone, 'Quick\nContacts'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Text('By continuing you agree to our Terms of Service and\nPrivacy Policy',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black45,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label) {
    return Column(
      children: [
        Container
        (
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey.withOpacity(0.1)),
          child: Icon(icon, size: 30.r, color: orange)),
        SizedBox(height: 5.h),
        Text(label,
            style:
                TextStyle(fontSize: 12.sp, color: Colors.black54,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      ],
    );
  }
}
