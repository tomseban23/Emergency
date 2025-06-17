// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:notifi_emp/consts/consts.dart';
// import 'package:notifi_emp/screens/employeepage.dart';

// class AddEmployeeScreen extends StatefulWidget {
//   final Function(Employee) onEmployeeAdded;

//   const AddEmployeeScreen({Key? key, required this.onEmployeeAdded}) : super(key: key);

//   @override
//   State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
// }

// class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _positionController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   String _selectedDepartment = '';
//   bool _isAdmin = false;
//   String? _photoUrl;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _selectImage() async {
//     try {
//       final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//       if (image != null) {
//         setState(() {
//           _photoUrl = image.path;
//         });
//       }
//     } catch (e) {
//       print("Image picker error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightgrey2,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppBar(
//                 title: const Text('Add Employee'),
//                 centerTitle: true,
//               ),
//               const SizedBox(height: 40),
//               const Text(
//                 'Profile Photo',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               GestureDetector(
//                 onTap: _selectImage,
//                 child: Container(
//                   height: 120,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.grey[300]!,
//                     ),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Center(
//                     child: _photoUrl == null
//                         ? Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.cloud_upload,
//                                 size: 32,
//                                 color: Colors.grey[400],
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Click to upload or tap to select image',
//                                 style: TextStyle(
//                                   color: Colors.grey[500],
//                                 ),
//                               ),
//                             ],
//                           )
//                         : Image.file(
//                             File(_photoUrl!),
//                             fit: BoxFit.cover,
//                           ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Full Name',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   fillColor: Colors.white,
//                   hintText: 'Enter full name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Position',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: _positionController,
//                 decoration: InputDecoration(
//                   hintText: 'Enter job position',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Department',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[300]!),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                     border: InputBorder.none,
//                   ),
//                   hint: const Text('Select department'),
//                   value: _selectedDepartment.isEmpty ? null : _selectedDepartment,
//                   items: const [
//                     DropdownMenuItem(
//                       value: 'Human Resources',
//                       child: Text('Human Resources'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Facilities',
//                       child: Text('Facilities'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'IT',
//                       child: Text('IT'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Marketing',
//                       child: Text('Marketing'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Sales',
//                       child: Text('Sales'),
//                     ),
//                   ],
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedDepartment = value ?? '';
//                     });
//                   },
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Email',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: _emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: 'Enter email address',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Phone',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextField(
//                 controller: _phoneController,
//                 keyboardType: TextInputType.phone,
//                 decoration: InputDecoration(
//                   hintText: 'Enter phone number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.grey[300]!),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 24,
//                     height: 24,
//                     child: Checkbox(
//                       value: _isAdmin,
//                       onChanged: (value) {
//                         setState(() {
//                           _isAdmin = value ?? false;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   const Text(
//                     'Grant admin privileges',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.amber[700],
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                   onPressed: () {
//                     if (_nameController.text.isNotEmpty &&
//                         _positionController.text.isNotEmpty &&
//                         _selectedDepartment.isNotEmpty) {
//                       final newEmployee = Employee(
//                         name: _nameController.text,
//                         position: _positionController.text,
//                         department: _selectedDepartment,
//                         photoUrl: _photoUrl,
//                         isActive: true,
//                         isAdmin: _isAdmin,
//                       );
//                       widget.onEmployeeAdded(newEmployee);
//                       Navigator.pop(context);
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Please fill out all required fields'),
//                         ),
//                       );
//                     }
//                   },
//                   child: const Text(
//                     'Add Employee',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
