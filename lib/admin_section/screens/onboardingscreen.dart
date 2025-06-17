import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifi_emp/admin_section/screens/bussinessname.dart';
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/admin_section/screens/signin.dart';

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                // Top spacing
                SizedBox(height: 50.h),
                
                // Logo and Title Section
                Column(
                  children: [
                    // Logo container with "logo" text
                    Container(
                      width: 100.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: indigo.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Text(
                          'Emertify',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: indigo,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    
                    // App title
                    Text(
                      'Emertify',
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    
                    // Subtitle
                    Text(
                      'Your trusted partner for emergency alerts\nand safety management',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                
                // Spacer to push content
                Spacer(flex: 2),
                
                // Action Buttons
                Column(
                  children: [
                    // Get Started Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BusinessName()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: indigo,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    
                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 56.h,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signin()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: indigo,
                          side: BorderSide(color: indigo, width: 2.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 40.h),
                
                // Feature Icons Section
                IntrinsicHeight(
                  child: Row(
                    children: [
                      _buildFeatureIcon(
                        Icons.notifications_active_outlined,
                        'Instant Alerts',
                        'Quick\nnotifications',
                      ),
                      _buildFeatureIcon(
                        Icons.location_on_outlined,
                        'Location',
                        'GPS tracking',
                      ),
                      _buildFeatureIcon(
                        Icons.contacts_outlined,
                        'Contacts',
                        'Quick sharing',
                      ),
                    ],
                  ),
                ),
                
                Spacer(flex: 1),
                
                // Terms and Privacy
             Padding(
  padding: EdgeInsets.only(bottom: 16.h),
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: 12.sp,
        color: Colors.grey[500],
        height: 1.4,
      ),
      children: [
        TextSpan(text: 'By continuing you agree to our '),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle, // or .baseline
          child: GestureDetector(
            onTap: () {
              // Navigate to Terms of Service
            },
            child: Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 12.sp,
                color: indigo,
                height: 1.4, // Match height
              ),
            ),
          ),
        ),
        TextSpan(text: ' and\n'),
        WidgetSpan(
          alignment: PlaceholderAlignment.middle, // or .baseline
          child: GestureDetector(
            onTap: () {
              // Navigate to Privacy Policy
            },
            child: Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 12.sp,
                color: indigo,
                height: 1.4, // Match height
              ),
            ),
          ),
        ),
      ],
    ),
  ),
)

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String title, String subtitle) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indigo.withOpacity(0.08),
            ),
            child: Icon(
              icon,
              size: 28.r,
              color: indigo,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 34.h, // Fixed height for title to ensure alignment
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            height: 26.h, // Fixed height for subtitle to ensure alignment
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}