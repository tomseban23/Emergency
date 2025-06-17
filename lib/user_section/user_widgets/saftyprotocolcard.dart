import 'package:flutter/material.dart';

class SafetyProtocolsCard extends StatefulWidget {
  @override
  _SafetyProtocolsCardState createState() => _SafetyProtocolsCardState();
}

class _SafetyProtocolsCardState extends State<SafetyProtocolsCard> {
  int _selectedIndex = 0;

  final List<String> _tabs = ['Emergency', 'Guidelines', 'Equipment', 'Chemical'];

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        // Emergency Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              color: Colors.red[50],
              icon: Icons.local_fire_department,
              title: 'Fire Emergency',
              text:
                  'Activate nearest fire alarm. Use stairs, not elevators. Proceed to designated assembly point.',
              titleColor: Colors.red,
            ),
            _buildSection(
              color: Colors.yellow[50],
              icon: Icons.house,
              title: 'Earthquake',
              text:
                  'Drop, cover, and hold on. Stay away from windows. After shaking stops, evacuate if necessary.',
              titleColor: Colors.amber[900],
            ),
            _buildSection(
              color: Colors.blue[50],
              icon: Icons.science,
              title: 'Chemical Spill',
              text:
                  'Alert supervisor immediately. Evacuate area. Do not touch spilled material. Follow MSDS procedures.',
              titleColor: Colors.blue[900],
            ),
            _buildSection(
              color: Colors.purple[50],
              icon: Icons.health_and_safety,
              title: 'Medical Emergency',
              text:
                  'Call emergency services. Locate nearest first aid kit or AED. Only provide assistance if trained.',
              titleColor: Colors.purple,
            ),
          ],
        );
      case 1:
        // Guidelines Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              color: Colors.blue[50],
              icon: Icons.rule,
              title: 'General Safety Rules',
              text:
                  'Always wear appropriate PPE. Report unsafe conditions. Follow all posted safety signs and instructions.',
              titleColor: Colors.blue[900],
            ),
            _buildSection(
              color: Colors.blue[50],
              icon: Icons.directions_walk,
              title: 'Walking & Working Surfaces',
              text:
                  'Keep walkways clear. Clean spills immediately. Use handrails on stairs. Report tripping hazards.',
              titleColor: Colors.blue[900],
            ),
            _buildSection(
              color: Colors.blue[50],
              icon: Icons.electrical_services,
              title: 'Electrical Safety',
              text:
                  'Inspect cords regularly. Don\'t overload outlets. Keep electrical panels accessible. Report damaged equipment.',
              titleColor: Colors.blue[900],
            ),
            _buildSection(
              color: Colors.blue[50],
              icon: Icons.chair,
              title: 'Ergonomics',
              text:
                  'Adjust workstations properly. Use proper lifting techniques. Take regular breaks. Report ergonomic concerns.',
              titleColor: Colors.blue[900],
            ),
          ],
        );
      case 2:
        // Equipment Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              color: Colors.green[50],
              icon: Icons.build,
              title: 'Machine Guarding',
              text:
                  'Never remove guards. Report missing guards. Follow lockout/tagout procedures. Keep clear of moving parts.',
              titleColor: Colors.green[800],
            ),
            _buildSection(
              color: Colors.green[50],
              icon: Icons.handyman,
              title: 'Hand Tools',
              text:
                  'Use right tool for the job. Inspect before use. Store properly. Wear appropriate PPE.',
              titleColor: Colors.green[800],
            ),
            _buildSection(
              color: Colors.green[50],
              icon: Icons.power,
              title: 'Powered Equipment',
              text:
                  'Only operate if trained. Inspect before use. Follow manufacturer instructions. Report malfunctions.',
              titleColor: Colors.green[800],
            ),
            _buildSection(
              color: Colors.green[50],
              icon: Icons.move_to_inbox,
              title: 'Material Handling',
              text:
                  'Use proper lifting techniques. Use mechanical aids when possible. Secure loads properly. Watch for pinch points.',
              titleColor: Colors.green[800],
            ),
          ],
        );
      case 3:
        // Chemical Tab
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              color: Colors.purple[50],
              icon: Icons.science,
              title: 'Hazard Communication',
              text:
                  'Read all labels. Review SDS before use. Know hazard symbols. Follow storage guidelines.',
              titleColor: Colors.purple[800],
            ),
            _buildSection(
              color: Colors.purple[50],
              icon: Icons.visibility,
              title: 'Personal Protection',
              text:
                  'Wear appropriate PPE. Use eye wash stations if exposed. Report all exposures immediately.',
              titleColor: Colors.purple[800],
            ),
            _buildSection(
              color: Colors.purple[50],
              icon: Icons.water_drop,
              title: 'Spill Response',
              text:
                  'Alert supervisor. Use spill kits if trained. Evacuate if necessary. Follow cleanup procedures.',
              titleColor: Colors.purple[800],
            ),
            _buildSection(
              color: Colors.purple[50],
              icon: Icons.archive,
              title: 'Storage & Disposal',
              text:
                  'Store incompatible chemicals separately. Keep containers closed. Follow disposal regulations.',
              titleColor: Colors.purple[800],
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildSection({
    Color? color,
    required IconData icon,
    required String title,
    required String text,
    Color? titleColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: titleColor, size: 28),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                        fontSize: 16)),
                SizedBox(height: 4),
                Text(text, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildTabButton(int index) {
  return GestureDetector(
    onTap: () {
      setState(() {
        _selectedIndex = index;
      });
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? Colors.blue[700]
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          _tabs[index],
          style: TextStyle(
            color: _selectedIndex == index
                ? Colors.white
                : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text("Safety Protocols",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
            SizedBox(height: 16),
         SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: List.generate(
      _tabs.length,
      (index) => Container(
        width: 120,
        margin: EdgeInsets.only(right: 8),
        child: _buildTabButton(index),
      ),
    ),
  ),
),


            SizedBox(height: 16),
            
            _buildContent(),
          ],
        ),
      ),
    );
  }
}
