// Reusable Emergency Contact Tile Widget
import 'package:flutter/material.dart';

class EmergencyContactTile extends StatelessWidget {
  final String name;
  final String relation;
  final String phone;
  final VoidCallback onTap;

  const EmergencyContactTile({
    Key? key,
    required this.name,
    required this.relation,
    required this.phone,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.person,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    relation,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.grey[600],
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        phone,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// edit for emergency contact

class EditEmergencyContactsDialog extends StatefulWidget {
  final List<Map<String, String>> initialContacts;
  final String bloodType;
  final String allergies;
  final String conditions;
  final void Function({
    required List<Map<String, String>> updatedContacts,
    required String updatedBloodType,
    required String updatedAllergies,
    required String updatedConditions,
  }) onSave;

  const EditEmergencyContactsDialog({
    Key? key,
    required this.initialContacts,
    required this.bloodType,
    required this.allergies,
    required this.conditions,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditEmergencyContactsDialog> createState() => _EditEmergencyContactsDialogState();
}

class _EditEmergencyContactsDialogState extends State<EditEmergencyContactsDialog> {
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> relationControllers;
  late List<TextEditingController> phoneControllers;

  late TextEditingController allergiesController;
  late TextEditingController conditionsController;
  String selectedBloodType = 'O+';

  @override
  void initState() {
    super.initState();
    nameControllers = widget.initialContacts.map((c) => TextEditingController(text: c['name'])).toList();
    relationControllers = widget.initialContacts.map((c) => TextEditingController(text: c['relation'])).toList();
    phoneControllers = widget.initialContacts.map((c) => TextEditingController(text: c['phone'])).toList();

    allergiesController = TextEditingController(text: widget.allergies);
    conditionsController = TextEditingController(text: widget.conditions);
    selectedBloodType = widget.bloodType;
  }

  void addContact() {
    setState(() {
      nameControllers.add(TextEditingController());
      relationControllers.add(TextEditingController());
      phoneControllers.add(TextEditingController());
    });
  }

  void removeContact(int index) {
    setState(() {
      nameControllers.removeAt(index);
      relationControllers.removeAt(index);
      phoneControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Emergency Contacts',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3142),
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(nameControllers.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Contact ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            TextButton(
                              onPressed: () => removeContact(index),
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Remove',
                                style: TextStyle(
                                  color: Color(0xFFEF4444),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildStyledTextField(
                          controller: nameControllers[index],
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 12),
                        _buildStyledTextField(
                          controller: relationControllers[index],
                          hintText: 'Relation',
                        ),
                        const SizedBox(height: 12),
                        _buildStyledTextField(
                          controller: phoneControllers[index],
                          hintText: 'Phone',
                        ),
                      ],
                    ),
                  );
                }),
                TextButton.icon(
                  onPressed: addContact,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    foregroundColor: const Color(0xFF6366F1),
                  ),
                  icon: const Icon(Icons.add_circle_outline, size: 20),
                  label: const Text(
                    'Add Another Contact',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Medical Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Blood Type',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              
                              border: Border.all(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: DropdownButtonFormField<String>(
                              value: selectedBloodType,
                              decoration: const InputDecoration(
                               
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                              ),
                               dropdownColor: Colors.white,
                              items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                                  .map((type) => DropdownMenuItem(
                                        value: type,
                                        child: Center(
                                          child: Text(
                                            type,
                                            style: const TextStyle(
                                              fontSize: 16,fontWeight: FontWeight.bold,
                                              color: Color(0xFF374151),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (val) => setState(() => selectedBloodType = val ?? 'O+'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Allergies',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildStyledTextField(
                            controller: allergiesController,
                            hintText: '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Medical Conditions',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: conditionsController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16),
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 16,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF374151),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {
                        final updatedContacts = List.generate(nameControllers.length, (index) => {
                              'name': nameControllers[index].text,
                              'relation': relationControllers[index].text,
                              'phone': phoneControllers[index].text,
                            });
                        widget.onSave(
                          updatedContacts: updatedContacts,
                          updatedBloodType: selectedBloodType,
                          updatedAllergies: allergiesController.text,
                          updatedConditions: conditionsController.text,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Save Changes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 16,
          ),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}