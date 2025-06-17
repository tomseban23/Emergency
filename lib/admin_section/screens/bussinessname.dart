import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:notifi_emp/consts/consts.dart';
import 'package:notifi_emp/consts/providers.dart';
import 'dart:convert';
import 'package:notifi_emp/admin_section/screens/email.dart';
import 'package:notifi_emp/admin_section/screens/signin.dart';
import 'package:provider/provider.dart';

class BusinessName extends StatefulWidget {
  const BusinessName({super.key});

  @override
  State<BusinessName> createState() => _BusinessNameState();
}

class _BusinessNameState extends State<BusinessName> {
  final TextEditingController _businessNameController = TextEditingController();
 String? _selectedIndustry;
  bool _isLoading = false;
  final List<String> _industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Other'
  ];

  // API for checking business name
  Future<void> _checkBusinessName(String businessName) async {
    if (businessName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Business name cannot be empty')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // try {
    //   final url = Uri.parse('$BaseUrl/organizations/checkBusinessName');
    //   print('Sending request to: $url');

    //   final response = await http.post(
    //     url,
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //     body: jsonEncode({'businessName': businessName}),
    //   );

     try {
      final url = Uri.parse('$BaseUrl/organizations/check-org-name?business_name=$businessName');
      print('Sending request to: $url');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       // body: jsonEncode({'businessName': businessName}),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Response data: $responseData');

           // Store the business name using the provider
      Provider.of<BusinessProvider>(context, listen: false).setBusinessName(businessName);

        // Show the response in a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text('${responseData['message']}'))),
        );

        Navigator.push(
          context,
          // MaterialPageRoute(builder: (context) => Email(businessName: businessName)),
                    MaterialPageRoute(builder: (context) => Email()),

        );
      } else {
        // Show the response in a SnackBar for non-200 status codes
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.body}')),
        );
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred while validating business name')),
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
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Responsive padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'What\'s your business called?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.06), // Responsive font size
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                 // width: screenWidth * 0.8, // Responsive width
                  child: Text(
                    'Start by entering your business name to\nset up your account',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 17.sp), // Responsive font size
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
                      controller: _businessNameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your business name',
                        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold), // Responsive font size
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                
                // Industry Dropdown
                Container(
                  height: screenHeight * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(.3), width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      value: _selectedIndustry,
                      hint: Text('Select Industry Type', 
                             style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                      items: _industries
                          .map((industry) => DropdownMenuItem<String>(
                            
                                value: industry,
                                child: Text(industry),
                              ))
                          .toList(),
                      onChanged: (value) {
                        Provider.of<BusinessProvider>(context, listen: false)
                            .setIndustryType(value!);
                        setState(() {
                          _selectedIndustry = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07), backgroundColor: orange),
                  onPressed: () => _checkBusinessName(_businessNameController.text),
                  child:
                      _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Continue', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp)),
                ),
                SizedBox(height: screenHeight * 0.04),
                Text('Are you joining an existing Organisation?',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 15.sp)),
                TextButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
},
                  child:
                      Text('Click here to SignUp as an employee',style: TextStyle(fontWeight: FontWeight.bold,color: orange,fontSize: 15.sp)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
