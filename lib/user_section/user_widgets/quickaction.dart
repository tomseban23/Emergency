import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAction(
          icon: Icons.phone,
          label: 'Emergency',
          bgColor: const Color(0xFFFFF3F3),
          iconColor: Colors.red,
          textColor: Colors.red,
          onTap: () {},
          context: context,
        ),
        const SizedBox(width: 16),
        _buildAction(
          icon: Icons.location_on,
          label: 'Location',
          bgColor: const Color(0xFFFFF8E1),
          iconColor: Colors.orange,
          textColor: Colors.orange,
          onTap: () {},
          context: context,
        ),
        const SizedBox(width: 16),
        _buildAction(
          icon: Icons.message,
          label: 'Message',
          bgColor: const Color(0xFFF3F6FF),
          iconColor: Colors.blue,
          textColor: Colors.blue,
          onTap: () {
            _showMessageDialog(context);
          },
          context: context,
        ),
      ],
    );
  }

  Widget _buildAction({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color iconColor,
    required Color textColor,
    required Function() onTap,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: iconColor, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 32),
            const SizedBox(height: 12),
            Text(label, style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  void _showMessageDialog(BuildContext context) {
    String? selectedRecipient;
    String selectedPriority = 'normal';
    bool attachLocation = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Send Message',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.grey),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),

                    // Recent Conversations
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Recent Conversations',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // James Wilson
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        tileColor: Colors.grey[100],
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.withOpacity(0.1),
                          child: const Icon(Icons.person_outline, color: Colors.indigo),
                        ),
                        title: const Text('James Wilson'),
                        subtitle: const Text('Emergency Coordinator'),
                        onTap: () {},
                      ),
                    ),

                    // Safety Team
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        tileColor: Colors.grey[100],
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo.withOpacity(0.1),
                          child: const Icon(Icons.group_outlined, color: Colors.indigo),
                        ),
                        title: const Text('Safety Team'),
                        subtitle: const Text('5 members'),
                        onTap: () {},
                      ),
                    ),

                    // Send To Dropdown
                   // Send To Dropdown
const Padding(
  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
  child: Text(
    'Send To',
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  ),
),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: DropdownButtonFormField<String>(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintText: 'Select recipient',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
    items: const [
      DropdownMenuItem(value: 'emergency', child: Text('Emergency Coordinator')),
      DropdownMenuItem(value: 'safety', child: Text('Safety Team')),
      DropdownMenuItem(value: 'floor', child: Text('Floor Supervisor')),
      DropdownMenuItem(value: 'medical', child: Text('Medical Team')),
    ],
    onChanged: (value) {
      setState(() {
        selectedRecipient = value;
      });
    },
    hint: const Text('Select recipient'),
  ),
),

                    // Message Priority
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                      child: Text(
                        'Message Priority',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Border color
        width: 1.0,         // Border width
      ),
      borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
    ),
    child: RadioListTile<String>(
      title: const Text('Normal'),
      value: 'normal',
      groupValue: selectedPriority,
      onChanged: (value) {
        setState(() {
          selectedPriority = value!;
        });
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduce gap
      dense: true, // Makes the tile more compact
      visualDensity: VisualDensity(horizontal: -4, vertical: 0), // Even closer
    ),
  ),
),
SizedBox(width: 8), // Space between radio buttons

                         Expanded(
  child: Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey, // Border color
        width: 1.0,         // Border width
      ),
      borderRadius: BorderRadius.circular(8.0), // Optional: rounded corners
    ),
    child: RadioListTile<String>(
      title: const Text('Urgent'),
      value: 'urgent',
      groupValue: selectedPriority,
      onChanged: (value) {
        setState(() {
          selectedPriority = value!;
        });
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0), // Reduce gap
      dense: true, // Makes the tile more compact
      visualDensity: VisualDensity(horizontal: -4, vertical: 0), // Even closer
    ),
  ),
),

                        ],
                      ),
                    ),

                    // Message Input
                    const Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 8.0),
                      child: Text(
                        'Message',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Type your message here...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),

                    // Attach Location Checkbox
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: attachLocation,
                            onChanged: (value) {
                              setState(() {
                                attachLocation = value ?? false;
                              });
                            },
                          ),
                          const Text(
                            'Attach my current location',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    // Action Buttons
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                side: const BorderSide(color: Colors.grey),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle send message logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text('Send Message'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
