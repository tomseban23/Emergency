// // Reusable Profile Header Card Widget
// import 'package:flutter/material.dart';

// class ProfileHeaderCard extends StatelessWidget {
//   final String name;
//   final String title;
//   final String imagePath;
//   final VoidCallback onEditPressed;

//   const ProfileHeaderCard({
//     Key? key,
//     required this.name,
//     required this.title,
//     required this.imagePath,
//     required this.onEditPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               CircleAvatar(
//                 radius: 40,
//                 backgroundColor: Colors.grey[300],
//                 child: const Icon(
//                   Icons.person,
//                   size: 40,
//                   color: Colors.grey,
//                 ),
//                 // backgroundImage: AssetImage(imagePath), // Uncomment when you have the image
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(6),
//                   decoration: const BoxDecoration(
//                     color: Colors.indigoAccent,
//                     shape: BoxShape.circle,
//                   ),
//                   child: const Icon(
//                     Icons.camera_alt,
//                     color: Colors.white,
//                     size: 16,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Text(
//             name,
//             style: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[600],
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: onEditPressed,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.indigoAccent,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 elevation: 0,
//               ),
//               child: const Text(
//                 'Edit Profile',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }