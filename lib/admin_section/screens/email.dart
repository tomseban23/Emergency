import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/consts/providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:notifi_emp/admin_section/screens/otp.dart';

class Email extends StatefulWidget {
 // final String businessName;

  const Email({Key? key, }) : super(key: key);

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final TextEditingController _emailController = TextEditingController();
  bool _isButtonEnabled = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadEmail(); // Load saved email when the widget initializes
  }

  // Function to load the saved email from SharedPreferences
  Future<void> _loadEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email') ?? ''; 
    setState(() {
      _emailController.text = savedEmail; // Set the text field with the saved email
      _validateEmail(); // Validate the email after loading it
    });
  }

  // Function to save the email to SharedPreferences
  Future<void> _saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email); // Save the email
  }

//only company mail

  // void _validateEmail() {
  //   final email = _emailController.text.trim();
  //   final isValidEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  //   final isBusinessEmail = !RegExp(r'@(gmail\.com|yahoo\.com|outlook\.com|hotmail\.com)$').hasMatch(email);

  //   setState(() {
  //     if (email.isEmpty || !isValidEmail || !isBusinessEmail) {
  //       _isButtonEnabled = false;
  //       _errorMessage = 'Please enter a valid Business Email';
  //     } else {
  //       _isButtonEnabled = true;
  //       _errorMessage = null;
  //     }
  //   });
  // }

  // All email Works

  void _validateEmail() {
  final email = _emailController.text.trim();
  final isValidEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  
  setState(() {
    // Check if the email is empty first
    if (email.isEmpty) {
      _isButtonEnabled = false;
      _errorMessage = null; // Do not show any error message when empty
    } else if (!isValidEmail) {
      _isButtonEnabled = false;
      _errorMessage = 'Please enter a valid email';
    } else {
      _isButtonEnabled = true;
      _errorMessage = null;
    }
  });
}



  @override
  Widget build(BuildContext context) {
     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "What's your business email?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.06),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                 // width: screenWidth * 0.8, // Responsive width
                  child: Text(
                    'We\'ll use this to setup your account and keep you informed',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 17.sp), // Responsive font size
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
                      onChanged: (value) => _validateEmail(),
                      decoration: InputDecoration(
                        hintText: 'Enter your business email',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                       
                      ),
                    ),
                  ),
                ),
                if (_errorMessage != null) // Conditionally show error message
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(_errorMessage!, style: TextStyle(color: Colors.red)),
                  ),
                SizedBox(height: 50.h),
                ElevatedButton(
                  style:  ElevatedButton.styleFrom(fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07), backgroundColor: orange),
                  onPressed: _isButtonEnabled
                      ? () {
                          _submitData();
                        }
                      : null,
                  child: const Text('Continue', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                ),
                // SizedBox(height: 60.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text('Already have an account?'),
                //     TextButton(
                //       onPressed: () {},
                //       child: Text('SignIn', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.sp)),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // api for send otp

// void _submitData() async {
//   String email = _emailController.text.trim();

//   // Save the email locally
//   await _saveEmail(email);

//   final response = await http.post(
//     Uri.parse('$BaseUrl/sendOtp'), // Replace with your actual API endpoint
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'email': email,
//     }),
//   );

//   // Print the response
//   print('Response status code: ${response.statusCode}');
//   print('Response body: ${response.body}');

//   if (response.statusCode >= 200 && response.statusCode <= 300) {
//     // Show success message with response body
//     ScaffoldMessenger.of(context).showSnackBar(
//      // SnackBar(content: Text('Data submitted successfully! Response: ${response.body}')),
//        SnackBar(content: Center(child: Text('Data submitted successfully'))),
//     );

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => OtpVerificationPage(email: email, businessName: widget.businessName)),
//     );
//   } else {
//     // Show error message with response body
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Failed to submit data. Response: ${response.body}')),
//     );
//   }
// }
void _submitData() async {
  String email = _emailController.text.trim();

  // Save the email locally
  await _saveEmail(email);

  // Store the email using the provider
  Provider.of<BusinessProvider>(context, listen: false).setEmail(email);

  final response = await http.get(
    Uri.parse('$BaseUrl/organizations/check-org-email?email_domain=$email'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode >= 200 && response.statusCode <= 300) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Data submitted successfully')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OtpVerificationPage()),
    );
  } else {
    // Try to parse error message from response body
    String errorMessage = 'Failed to submit data';
    try {
      final responseData = jsonDecode(response.body);
      if (responseData['message'] != null) {
        errorMessage = responseData['message'];
      }
    } catch (e) {
      // If response is not JSON, keep default error message
      print('Error parsing response: $e');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMessage)),
    );
  }
}



}
