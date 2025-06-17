import 'package:flutter/material.dart';

// Model class for Personal Information
class PersonalInfo {
  String fullName;
  String employeeId;
  String position;
  String department;
  String workLocation;

  PersonalInfo({
    required this.fullName,
    required this.employeeId,
    required this.position,
    required this.department,
    required this.workLocation,
  });

  PersonalInfo copyWith({
    String? fullName,
    String? employeeId,
    String? position,
    String? department,
    String? workLocation,
  }) {
    return PersonalInfo(
      fullName: fullName ?? this.fullName,
      employeeId: employeeId ?? this.employeeId,
      position: position ?? this.position,
      department: department ?? this.department,
      workLocation: workLocation ?? this.workLocation,
    );
  }
}

// Main Personal Information Widget
class PersonalInfoWidget extends StatefulWidget {
  final PersonalInfo initialData;
  final Function(PersonalInfo)? onDataChanged;

  const PersonalInfoWidget({
    Key? key,
    required this.initialData,
    this.onDataChanged,
  }) : super(key: key);

  @override
  State<PersonalInfoWidget> createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  late PersonalInfo personalInfo;

  @override
  void initState() {
    super.initState();
    personalInfo = widget.initialData;
  }

  void _updatePersonalInfo(PersonalInfo updatedInfo) {
    setState(() {
      personalInfo = updatedInfo;
    });
    if (widget.onDataChanged != null) {
      widget.onDataChanged!(updatedInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with edit button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.indigoAccent,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => EditPersonalInfoDialog(
                      personalInfo: personalInfo,
                      onSave: _updatePersonalInfo,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Personal Information Tiles
          PersonalInfoTile(
            icon: Icons.person_outline,
            label: 'Full Name',
            value: personalInfo.fullName,
          ),
          PersonalInfoTile(
            icon: Icons.badge_outlined,
            label: 'Employee ID',
            value: personalInfo.employeeId,
          ),
          PersonalInfoTile(
            icon: Icons.work_outline,
            label: 'Position',
            value: personalInfo.position,
          ),
          PersonalInfoTile(
            icon: Icons.business_outlined,
            label: 'Department',
            value: personalInfo.department,
          ),
          PersonalInfoTile(
            icon: Icons.location_on_outlined,
            label: 'Work Location',
            value: personalInfo.workLocation,
          ),
        ],
      ),
    );
  }
}

// Individual info tile widget
class PersonalInfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const PersonalInfoTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.grey[600],
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Edit Personal Information Dialog
class EditPersonalInfoDialog extends StatefulWidget {
  final PersonalInfo personalInfo;
  final Function(PersonalInfo) onSave;

  const EditPersonalInfoDialog({
    Key? key,
    required this.personalInfo,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditPersonalInfoDialog> createState() => _EditPersonalInfoDialogState();
}

class _EditPersonalInfoDialogState extends State<EditPersonalInfoDialog> {
  late TextEditingController fullNameController;
  late TextEditingController employeeIdController;
  late TextEditingController positionController;
  late TextEditingController departmentController;
  late TextEditingController workLocationController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.personalInfo.fullName);
    employeeIdController = TextEditingController(text: widget.personalInfo.employeeId);
    positionController = TextEditingController(text: widget.personalInfo.position);
    departmentController = TextEditingController(text: widget.personalInfo.department);
    workLocationController = TextEditingController(text: widget.personalInfo.workLocation);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    employeeIdController.dispose();
    positionController.dispose();
    departmentController.dispose();
    workLocationController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedInfo = PersonalInfo(
      fullName: fullNameController.text,
      employeeId: employeeIdController.text,
      position: positionController.text,
      department: departmentController.text,
      workLocation: workLocationController.text,
    );
    
    widget.onSave(updatedInfo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const Text(
                  'Edit Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
          
                // Form Fields
                _buildTextField(
                  controller: fullNameController,
                  label: 'Full Name',
                ),
                const SizedBox(height: 20),
                
                _buildTextField(
                  controller: employeeIdController,
                  label: 'Employee ID',
                ),
                const SizedBox(height: 20),
                
                _buildTextField(
                  controller: positionController,
                  label: 'Position',
                ),
                const SizedBox(height: 20),
                
                _buildTextField(
                  controller: departmentController,
                  label: 'Department',
                ),
                const SizedBox(height: 20),
                
                _buildTextField(
                  controller: workLocationController,
                  label: 'Work Location',
                ),
                const SizedBox(height: 32),
          
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1), // Indigo-500
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
          decoration: InputDecoration(
            // filled: true,
            // fillColor: Colors.grey[50],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF6366F1), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}