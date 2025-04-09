import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/consts/providers.dart';
import 'dart:convert';

import 'package:notifi_emp/screens/notif_req.dart';
import 'package:provider/provider.dart';

class Setup extends StatefulWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _nameError;
  String? _passwordError;
  String? _confirmPasswordError;
  //bool _isTermsAgreed = false;
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false; // Add this line

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateName);
    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_validateConfirmPassword);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateName() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() {
        _nameError = "Name is required";
      });
      return;
    }
     if (name.length < 3) {
      setState(() {
        _nameError = "Name must be at least 3 letters";
      });
      return;
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(name)) {
      setState(() {
        _nameError = "Name should only contain letters and spaces";
      });
      return;
    }
    setState(() {
      _nameError = null;
    });
  }

  void _validatePassword() {
    final password = _passwordController.text.trim();
    if (password.isEmpty) {
      setState(() {
        _passwordError = "Password is required";
      });
      return;
    }
    if (password.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(password) ||
        !RegExp(r'[0-9]').hasMatch(password) ||
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      setState(() {
        _passwordError =
        "Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.";
      });
      return;
    }
    setState(() {
      _passwordError = null;
    });
    _validateConfirmPassword(); // Also validate confirm password when password changes
  }

  void _validateConfirmPassword() {
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (confirmPassword.isEmpty) {
      setState(() {
        _confirmPasswordError = "Confirm Password is required";
      });
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _confirmPasswordError = "Passwords do not match";
      });
      return;
    }

    setState(() {
      _confirmPasswordError = null;
    });
  }


  // Future<void> _registerUser() async {
  //   // _validateName(); // No need to validate here, it's already happening
  //   // _validatePassword();
  //   // _validateConfirmPassword();

  //   // if (_nameError != null || _passwordError != null || _confirmPasswordError != null || !_isTermsAgreed) {
  //    if (_nameError != null || _passwordError != null || _confirmPasswordError != null ) {
  //     // if (!_isTermsAgreed) {   //Not requried it validated in _isValidInput()
  //     //   _showSnackBar("You must agree to the Terms and Conditions");
  //     // }
  //     return;
  //   }

  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     final response = await http.post(
  //       Uri.parse("https://your-backend-url.com/api/register"),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "name": _nameController.text.trim(),
  //         "password": _passwordController.text.trim(),
  //       }),
  //     );

  //     final responseData = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       _showSnackBar("Account created successfully!");
  //       // Navigate to next screen

  //        Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => AllowNotificationsScreen(),
  //       ),
  //     );
  //     } else {
  //       _showSnackBar(responseData["message"] ?? "Registration failed");
  //     }
  //   } catch (e) {
  //     _showSnackBar("An error occurred. Try again.");
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  Future<void> _registerUser() async {
  if (_nameError != null || _passwordError != null || _confirmPasswordError != null) {
    return;
  }

  setState(() {
    _isLoading = true;
  });

  try {
    // Access businessName and email from BusinessProvider
    final businessProvider = Provider.of<BusinessProvider>(context, listen: false);
    String businessName = businessProvider.businessName;
    String email = businessProvider.email;

    debugPrint("Registering user with:");
    debugPrint("Name: ${_nameController.text.trim()}");
    debugPrint("Password: ${_passwordController.text.trim()}");
    debugPrint("Business Name: $businessName");
    debugPrint("Email: $email");

    final response = await http.post(
      Uri.parse("$BaseUrl/organizations/register"), // Replace with your actual API endpoint
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "fullName": _nameController.text.trim(),
        "password": _passwordController.text.trim(),
       // "businessName": businessName,
        "email": email,
      }),
    );

    debugPrint("Response Status Code: ${response.statusCode}");
    debugPrint("Response Body: ${response.body}");

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      _showSnackBar("Account created successfully!");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AllowNotificationsScreen(),
        ),
      );
    } else {
      _showSnackBar(responseData["message"] ?? "Registration failed");
    }
  } catch (e) {
    debugPrint("Error during registration: $e");
    _showSnackBar("An error occurred. Try again.");
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  bool _isValidInput() {
    return _nameError == null &&
        _passwordError == null &&
        _confirmPasswordError == null ;
        //&&
       // _isTermsAgreed;
  }

  @override
  Widget build(BuildContext context) {
       double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   iconTheme: const IconThemeData(color: Colors.black),
        // ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'Set Up your Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.06),
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    'You are almost there! Enter your full name and create a secure password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60.h),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Full Name',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
                      ),
                    ],
                  ),

                  // Name Field
                  _buildTextField(_nameController, 'Entre your full name', isNameField: true, errorText: _nameError),
                  SizedBox(height: 20.h),
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
                      ),
                    ],
                  ),

                  // Password Field
                  _buildTextField(_passwordController, 'Create a password', isPassword: true, errorText: _passwordError, isConfirmPasswordField: false),
                  SizedBox(height: 20.h),
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Confirm Password',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18),),
                      ),
                    ],
                  ),

                  // Confirm Password Field
                  _buildTextField(_confirmPasswordController, 'Re-entre your password', isPassword: true, errorText: _confirmPasswordError, isConfirmPasswordField: true),
                  SizedBox(height: 30.h),

                  // Terms and Conditions Checkbox
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: _isTermsAgreed,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _isTermsAgreed = value ?? false;
                  //         });
                  //       },
                  //     ),
                  //     const Expanded(
                  //       child: Text(
                  //         'I agree to the Terms and Conditions',
                  //         style: TextStyle(fontWeight: FontWeight.w400),
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  // Create Account Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(360, 60),
                      backgroundColor: orange,
                    ),
                    onPressed: _isLoading || !_isValidInput() ? null : _registerUser,
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)
                    ),
                  ),
                  //SizedBox(height: 20.h),

                  // TextButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'By Signing Up you agree to our Privacy Policy and Terms of Service',
                  //     style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool isPassword = false, bool isNameField = false, String? errorText, bool isConfirmPasswordField = false}) {
    return Container(
      // height: 56.h, //Take this out because it will not show error text if the container has fixed height
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: errorText != null ? Colors.red : Colors.grey.withOpacity(.3), width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            obscureText: isPassword && (isConfirmPasswordField ? !_isConfirmPasswordVisible : !_isPasswordVisible),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16, letterSpacing: 0.08.sp,fontWeight: FontWeight.bold),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              suffixIcon: isPassword
                  ? IconButton(
                icon: (isConfirmPasswordField ? _isConfirmPasswordVisible : _isPasswordVisible) ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    if (isConfirmPasswordField) {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    } else {
                      _isPasswordVisible = !_isPasswordVisible;
                    }
                  });
                },
              )
                  : null,
            ),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                errorText,
                style: TextStyle(color: Colors.red, fontSize: 12.sp),
              ),
            ),
        ],
      ),
    );
  }
}
