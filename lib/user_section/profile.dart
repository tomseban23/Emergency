import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notifi_emp/user_section/profile_widget/contctinfo_widg.dart';
import 'package:notifi_emp/user_section/profile_widget/emgcnt_widg.dart';
import 'package:notifi_emp/user_section/profile_widget/medical_widg.dart';
import 'package:notifi_emp/user_section/profile_widget/notifPref_widg.dart';
import 'package:notifi_emp/user_section/profile_widget/personlinfo_widg.dart';
import 'package:notifi_emp/user_section/profile_widget/prof_sett_widg.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PersonalInfo personalInfo = PersonalInfo(
    fullName: "Tom Sebastian",
    employeeId: "EMP-2023-0458",
    position: "Specialist",
    department: "Production - Safety Division",
    workLocation: "Chemical Plant - Building B, Floor 2",
  );
  
  String email = 'tomsebastian715@gmail.com';
  String phone = '9562377168';
  String emergency = '9605474465';

  List<Map<String, String>> emergencyContacts = [
    {'name': 'Tom', 'relation': 'Brother', 'phone': '9562377168'},
    {'name': 'Sebastian', 'relation': 'Brother', 'phone': '9605474465'},
  ];

  String bloodType = 'A+';
  String allergies = 'Nothing';
  String medicalConditions = 'None';
  
  // Add image file variable
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  void updatePersonalInfo(PersonalInfo updatedInfo) {
    setState(() {
      personalInfo = updatedInfo;
    });
    print('Personal info updated: ${updatedInfo.fullName}');
  }

  void updateContactInfo(String newEmail, String newPhone, String newEmergency) {
    setState(() {
      email = newEmail;
      phone = newPhone;
      emergency = newEmergency;
    });
  }

  void updateEmergencyAndMedicalInfo({
    required List<Map<String, String>> updatedContacts,
    required String updatedBloodType,
    required String updatedAllergies,
    required String updatedConditions,
  }) {
    setState(() {
      emergencyContacts = updatedContacts;
      bloodType = updatedBloodType;
      allergies = updatedAllergies;
      medicalConditions = updatedConditions;
    });
  }

  // Image picker methods
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image from gallery: $e');
      _showErrorSnackBar('Failed to pick image from gallery');
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image from camera: $e');
      _showErrorSnackBar('Failed to capture image from camera');
    }
  }

  void _showImagePickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Select Profile Picture',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.indigoAccent),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.indigoAccent),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
              if (_profileImage != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Remove Photo'),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _profileImage = null;
                    });
                  },
                ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey[300],
          backgroundImage: _profileImage != null 
            ? FileImage(_profileImage!) 
            : const AssetImage('assets/person/download (1).jpeg') as ImageProvider,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: _showImagePickerBottomSheet,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.indigoAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header - Updated to use dynamic values
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 230, 233, 252),
                    Color.fromARGB(255, 230, 233, 252),
                    Colors.white,
                  ],
                  stops: [0.0, 0.3, 1.0],
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  _buildProfileImage(),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personalInfo.fullName, // Dynamic full name
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          personalInfo.position, // Dynamic position
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Edit Profile Button
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PersonalInfoWidget(
                initialData: personalInfo,
                onDataChanged: updatePersonalInfo,
              ),
            ),

            const SizedBox(height: 20),

            // Contact Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Contact Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, color: Colors.indigoAccent),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => EditContactInfoDialog(
                                email: email,
                                phone: phone,
                                emergency: emergency,
                                onSave: updateContactInfo,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ContactTile(icon: Icons.email_outlined, label: 'Email', value: email, onTap: () {}),
                    ContactTile(icon: Icons.phone_outlined, label: 'Phone', value: phone, onTap: () {}),
                    ContactTile(icon: Icons.emergency_outlined, label: 'Emergency Contact', value: emergency, onTap: () {}),
                  ],
                ),
              ),
            ),

            // Emergency + Medical Info Combined
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Emergency Contacts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, color: Colors.indigoAccent),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => EditEmergencyContactsDialog(
                                initialContacts: emergencyContacts,
                                bloodType: bloodType,
                                allergies: allergies,
                                conditions: medicalConditions,
                                onSave: updateEmergencyAndMedicalInfo,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ...emergencyContacts.map((contact) => EmergencyContactTile(
                          name: contact['name']!,
                          relation: contact['relation']!,
                          phone: contact['phone']!,
                          onTap: () {},
                        )),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Medical Information',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigoAccent[700])),
                          const SizedBox(height: 12),
                          Text('Blood Type: $bloodType', style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.w600)),
                          const SizedBox(height: 8),
                          Text('Allergies: $allergies', style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.w600)),
                          const SizedBox(height: 8),
                          Text('Medical Conditions: $medicalConditions', style: TextStyle(fontSize: 15, color: Colors.grey[700], fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: NotificationPreferencesCard()),
            const SizedBox(height: 20),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: SettingsMenuCard()),
          ],
        ),
      ),
    );
  }
}
