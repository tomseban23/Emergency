import 'dart:async';
import 'package:flutter/material.dart';

class ReportVisitorButton extends StatefulWidget {
  @override
  State<ReportVisitorButton> createState() => _ReportVisitorButtonState();
}

class _ReportVisitorButtonState extends State<ReportVisitorButton> {
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
          _showVisitorDialog(context);
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

  void _showVisitorDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ReportVisitorDialog(),
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
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Button container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue[100]!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_add, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Report Visitor',
                          style: TextStyle(
                              color: Colors.blue,
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
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Text(
          //   'Press and hold for 3 seconds to report a visitor',
          //   style: TextStyle(color: Colors.grey[600], fontSize: 14),
          // ),
          // SizedBox(height: 8),
        ],
      ),
    );
  }
}



class ReportVisitorDialog extends StatefulWidget {
  @override
  _ReportVisitorDialogState createState() => _ReportVisitorDialogState();
}

class _ReportVisitorDialogState extends State<ReportVisitorDialog> {
  final _nameController = TextEditingController();
  final _companyController = TextEditingController();
  final _contactController = TextEditingController();
  final _locationController = TextEditingController(text: 'Building B - Floor 2');
  final _purposeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  @override
  void dispose() {
    _nameController.dispose();
    _companyController.dispose();
    _contactController.dispose();
    _locationController.dispose();
    _purposeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get keyboard height to adjust dialog position
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Header with close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Report Visitor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
              SizedBox(height: 24),
              
              // Visitor Name field
              Text(
                'Visitor Name*',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter visitor\'s full name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter visitor\'s name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              // Company Name field
              Text(
                'Company Name*',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _companyController,
                decoration: InputDecoration(
                  hintText: 'Enter company name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              // Contact Number field
              Text(
                'Contact Number*',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(
                  hintText: 'Enter contact number',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              
              // Current Location field
              Text(
                'Current Location*',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        hintText: 'Select location',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter location';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.location_on_outlined, color: Colors.grey),
                      onPressed: () {
                        // Location picker logic
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              // Purpose of Visit field
              Text(
                'Purpose of Visit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: _purposeController,
                decoration: InputDecoration(
                  hintText: 'Enter purpose of visit',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              
              // Fire Alert warning
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Active Fire Alert',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              
              // Submit button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate & Submit logic
                    if (_formKey.currentState!.validate()) {
                      // Process data
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5b7ff3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Submit Report',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}