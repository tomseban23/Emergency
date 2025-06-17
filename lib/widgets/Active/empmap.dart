// Employee Map Widget
import 'package:flutter/material.dart';

class EmployeeMapWidget extends StatelessWidget {
  const EmployeeMapWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(0),
      ),
      child: Stack(
        children: [
          // This is a placeholder for an actual map
          // In a real app, you would use a package like google_maps_flutter
          Image.asset(
            'assets/map.jpg', // You'll need to provide a placeholder image
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          
          // Map markers
          Positioned(
            left: 50,
            top: 100,
            child: _buildMapMarker(Colors.green),
          ),
          Positioned(
            left: 150,
            top: 80,
            child: _buildMapMarker(Colors.red),
          ),
          Positioned(
            right: 100,
            top: 90,
            child: _buildMapMarker(Colors.amber),
          ),
          Positioned(
            left: 100,
            bottom: 30,
            child: _buildMapMarker(Colors.green),
          ),
          Positioned(
            right: 50,
            bottom: 50,
            child: _buildMapMarker(Colors.green),
          ),
          
          // Map legend
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem(Colors.green, 'Safe'),
                  const SizedBox(width: 16),
                  _buildLegendItem(Colors.red, 'Not Safe'),
                  const SizedBox(width: 16),
                  _buildLegendItem(Colors.amber, 'Pending'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapMarker(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

