import 'package:flutter/material.dart';

class UserStatusCard extends StatelessWidget {
  final String name;
  final String department;
  final bool isSafe;
  final String lastUpdated;

  const UserStatusCard({
    Key? key,
    required this.name,
    required this.department,
    required this.isSafe,
    required this.lastUpdated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          // Avatar with Safe Badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.green[700],
                  size: 28,
                ),
              ),
              if (isSafe)
                Positioned(
                  bottom: -5,
                  right: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green[500],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.shield_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 16),

          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  department,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.green[500],
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Safe',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[500],
                            ),
                          ),
                          //Spacer(),
                         
                        ],
                      ),
                    ),
                     SizedBox(width: 10,),
                          Text(
                                  'Updated $lastUpdated',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[500],
                                  ),
                                ),
                  ],
                ),
              ],
            ),
          ),
       //   const SizedBox(width: 8),
          
        ],
      ),
    );
  }
}