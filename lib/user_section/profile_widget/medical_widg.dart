// // Reusable Medical Info Card Widget
// import 'package:flutter/material.dart';

// class MedicalInfoCard extends StatelessWidget {
//   final String bloodType;
//   final String allergies;
//   final String medicalConditions;

//   const MedicalInfoCard({
//     Key? key,
//     required this.bloodType,
//     required this.allergies,
//     required this.medicalConditions,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.indigoAccent.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(12),
       
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Medical Information',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.indigoAccent[700],
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Blood Type: $bloodType',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[700],
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Allergies: $allergies',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[700],
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Medical Conditions: $medicalConditions',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[700],
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
