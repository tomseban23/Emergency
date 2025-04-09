import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:notifi_emp/consts/consts.dart';
import 'dart:convert';

import 'package:notifi_emp/screens/dashboard.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login(String email, String password) async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://your-backend-url.com/api/login'); // Replace with your backend URL
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Handle successful login (e.g., navigate to another page)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()), // Replace with your dashboard page
        );
      } else {
        // Handle error response
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${response.body}')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
         // title: Text('Sign In'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.06), // Responsive font size
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  child: Text(
                    'Enter your email and password to access your account',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 17.sp), // Responsive font size
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), 
                Center(
                  child: Container(
                    height: screenHeight * 0.07, // Responsive height
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.3), width: 2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), // Responsive font size
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Container(
                    height: screenHeight * 0.07, // Responsive height
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(.3), width: 2),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), // Responsive font size
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07), backgroundColor: orange),
                  onPressed: () {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    if (email.isNotEmpty && password.isNotEmpty) {
                      login(email, password);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill all fields')),
                      );
                    }
                  },
                  child:
                      _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Sign In', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp)),
                ),
                // SizedBox(height: screenHeight * 0.04),
                // Text('Don\'t have an account?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15.sp)),
                // TextButton(
                //   onPressed: () {
                //    // Navigator.push(context, MaterialPageRoute(builder: (context) => BusinessName()));
                //   },
                //   child:
                //       Text('Click here to create one',style: TextStyle(fontWeight: FontWeight.bold,color: orange,fontSize: 15.sp)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
