import 'dart:async';
import 'package:flutter/material.dart';

class ReportEmergencyButton extends StatefulWidget {
  @override
  State<ReportEmergencyButton> createState() => _ReportEmergencyButtonState();
}

class _ReportEmergencyButtonState extends State<ReportEmergencyButton> {
  Timer? _holdTimer;
  bool _isHolding = false;
  double _holdProgress = 0.0;

  void _startHold(BuildContext context) {
    setState(() {
      _isHolding = true;
      _holdProgress = 0.0;
    });
    
    const holdDuration = Duration(seconds: 3);
    const tick = Duration(milliseconds: 50);

    _holdTimer = Timer.periodic(tick, (timer) {
      setState(() {
        _holdProgress += tick.inMilliseconds / holdDuration.inMilliseconds;
        if (_holdProgress >= 1.0) {
          _holdProgress = 1.0;
          _isHolding = false;
          timer.cancel();
          _showEmergencyDialog(context);
        }
      });
    });
  }

  void _cancelHold() {
    _holdTimer?.cancel();
    setState(() {
      _isHolding = false;
      _holdProgress = 0.0;
    });
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ReportEmergencyDialog(),
    );
  }

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => _startHold(context),
      onLongPressEnd: (_) => _cancelHold(),
      onLongPressUp: _cancelHold,
      onTapUp: (_) => _cancelHold(),
      onTapCancel: _cancelHold,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Button container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red[100]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notification_important, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Report Emergency',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ],
                  ),
                ),
                
                // Progress indicator overlay - positioned at the bottom
                if (_isHolding)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: LinearProgressIndicator(
                        value: _holdProgress,
                        minHeight: 6,
                        backgroundColor: Colors.transparent,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Text(
          //   'Press and hold for 3 seconds to report an emergency',
          //   style: TextStyle(color: Colors.grey[600], fontSize: 14),
          // ),
          // SizedBox(height: 8),
        ],
      ),
    );
  }
}

class ReportEmergencyDialog extends StatefulWidget {
  @override
  _ReportEmergencyDialogState createState() => _ReportEmergencyDialogState();
}

class _ReportEmergencyDialogState extends State<ReportEmergencyDialog> {
  String? _selectedType;
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _locationController.text = 'Building B, Floor 2, Room 201';
  }

  @override
  void dispose() {
    _detailsController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Report Emergency',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red[700]),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 16),
             Text('Emergency Type', style: TextStyle(fontWeight: FontWeight.bold)),
SizedBox(height: 8),
LayoutBuilder(
  builder: (context, constraints) {
    // Calculate chip width for 2 chips per row and 1 spacing (12px)
    double totalSpacing = 12.0;
    double chipWidth = (constraints.maxWidth - totalSpacing) / 2;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTypeOption('Fire', Icons.local_fire_department, chipWidth),
            SizedBox(width: 12),
            _buildTypeOption('Medical', Icons.favorite, chipWidth),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTypeOption('Security', Icons.security, chipWidth),
            SizedBox(width: 12),
            _buildTypeOption('Other', Icons.error_outline, chipWidth),
          ],
        ),
      ],
    );
  },
),

              SizedBox(height: 16),
              Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                controller: _detailsController,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Please describe the emergency situation...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              SizedBox(height: 16),
              Text('Your Location', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextField(
                
                controller: _locationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300,width: 1)),
                  contentPadding: EdgeInsets.all(12),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('Cancel'),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        if (_selectedType == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please select an emergency type')),
                          );
                          return;
                        }
                        // Here you would normally send the report to your backend
                        print('Emergency Type: $_selectedType');
                        print('Details: ${_detailsController.text}');
                        print('Location: ${_locationController.text}');
                        Navigator.of(context).pop();
                      },
                      child: Text('Report Emergency', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTypeOption(String type, IconData icon, double chipWidth) {
    final isSelected = _selectedType == type;
    return SizedBox(
      width: chipWidth,
      height: 44,
      child: ChoiceChip(
        labelPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.red : Colors.red[300], size: 20),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                type,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected ? Colors.red : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedType = selected ? type : null;
          });
        },
        selectedColor: Colors.red[50],
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.red : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
