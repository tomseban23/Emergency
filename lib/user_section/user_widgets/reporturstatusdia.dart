import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';

class ReportStatusDialog extends StatefulWidget {
  @override
  State<ReportStatusDialog> createState() => _ReportStatusDialogState();
}

class _ReportStatusDialogState extends State<ReportStatusDialog> {
  int selectedStatus = 0;
  TextEditingController notesController = TextEditingController();
  String location = "Building B - Floor 2";

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text("Report Your Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 16),
              Text("Select Your Status", style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              _statusTile("I am Safe", 0, Colors.green[50], Colors.green, Icons.verified_user),
              SizedBox(height: 8),
              _statusTile("Need Assistance", 1, Colors.yellow[50], Colors.orange, Icons.warning_amber_rounded),
              SizedBox(height: 8),
              _statusTile("Emergency Help Needed", 2, Colors.red[50], Colors.red, Icons.error_outline),
              SizedBox(height: 20),
              Text("Your Location", style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey),
                    SizedBox(width: 8),
                    Expanded(child: Text(location)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () {
                  // Implement location update logic
                },
                icon: Icon(Icons.location_on),
                label: Text("Update Location"),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  side: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              SizedBox(height: 20),
              Text("Additional Notes", style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  hintText: "Add any additional information...",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                minLines: 2,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    // Handle submit
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit Report", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 Widget _statusTile(String label, int value, Color? fillColor, Color borderColor, IconData icon) {
  bool selected = selectedStatus == value;
  return GestureDetector(
    onTap: () => setState(() => selectedStatus = value),
    child: Container(
      decoration: BoxDecoration(
        color: selected ? fillColor : Colors.transparent,
        border: Border.all(
          color: borderColor, // Always use the status color
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Row(
        children: [
          Icon(icon, color: borderColor),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (selected)
            Icon(Icons.check, color: borderColor),
        ],
      ),
    ),
  );
}

}
