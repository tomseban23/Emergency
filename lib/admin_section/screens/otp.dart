import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/consts/providers.dart';
import 'package:notifi_emp/admin_section/screens/setup.dart';
import 'package:provider/provider.dart';


class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  List<String> otpCode = List.filled(6, "");
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNodes[0]);
    });
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  // Function to resend OTP
  void _resendOtp() async {
    final businessProvider = Provider.of<BusinessProvider>(context, listen: false);
    String email = businessProvider.email;

    try {
      final url = Uri.parse('$BaseUrl/organizations/sendOtp');
      final headers = <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final body = jsonEncode(<String, String>{
        'email': email,
      });

      debugPrint("Resend OTP Request URL: $url");
      debugPrint("Resend OTP Request Headers: $headers");
      debugPrint("Resend OTP Request Body: $body");

      final response = await http.post(url, headers: headers, body: body);

      debugPrint("Resend OTP Response Status Code: ${response.statusCode}");
      debugPrint("Resend OTP Response Body: ${response.body}");

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text('OTP resent successfully!'),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text('Failed to resend OTP.'),
            ),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${error.toString()}")),
      );
    }
  }

  // Function to verify OTP
  Future<void> verifyOtp() async {
    String otp = otpCode.join(); // Combine all 6 digits into a single string

    final businessProvider = Provider.of<BusinessProvider>(context, listen: false);
    String email = businessProvider.email;
    String businessName = businessProvider.businessName;
    String industryType = businessProvider.industryType;

    if (otp.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter the complete OTP")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final url = Uri.parse('$BaseUrl/organizations/verifyOtp');
      final headers = {"Content-Type": "application/json"};
      final body = jsonEncode({
        "email": email,
        "otp": otp,
        'businessName': businessName,
        'businessType': industryType,
      });

      debugPrint("Verify OTP Request URL: $url");
      debugPrint("Verify OTP Request Headers: $headers");
      debugPrint("Verify OTP Request Body: $body");

      final response = await http.post(url, headers: headers, body: body);

      debugPrint("Verify OTP Response Status Code: ${response.statusCode}");
      debugPrint("Verify OTP Response Body: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        debugPrint("Parsed Response Data: $data");

        // Extract the message from the response data
        final message = data['message'] ?? "OTP Verified Successfully"; // Use a default message if 'message' is not present

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)), // Show the extracted message
        );

        // Navigate to the next screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Setup()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "OTP Verification Failed")),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${error.toString()}")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: screenSize.height * 0.02),
                  Text(
                    "Let's verify your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.025),
                  Text(
                    "We've sent a 6-digit verification code to your email",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: screenSize.width * 0.05,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) => buildOtpDigitInput(index, screenSize)),
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  Text(
                    '  Code expires in:',
                    style: TextStyle(
                        color: Colors.grey, fontSize: screenSize.width * 0.04, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: _resendOtp,
                        child: Text(
                          "Resend Code",
                          style: TextStyle(color: orange, fontSize: screenSize.width * 0.04),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.04),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.02),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: isLoading ? null : verifyOtp,
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text('Verify & Continue',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.sp)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOtpDigitInput(int index, Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.07,
      width: screenSize.width * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextField(
          focusNode: focusNodes[index],
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 1,
          style: TextStyle(fontSize: 20.sp),
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.withOpacity(.3), width: 2),
            ),
          ),
          onChanged: (value) {
            setState(() {
              otpCode[index] = value;
            });
            if (value.isNotEmpty && index < 5) {
              FocusScope.of(context).requestFocus(focusNodes[index + 1]);
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
            }
          },
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ),
    );
  }
}
