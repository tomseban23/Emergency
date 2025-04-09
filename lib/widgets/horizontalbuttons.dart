import 'package:flutter/material.dart';
import 'package:notifi_emp/consts/consts.dart';

class HorizontalButtonRow extends StatefulWidget {
  const HorizontalButtonRow({Key? key}) : super(key: key);

  @override
  _HorizontalButtonRowState createState() => _HorizontalButtonRowState();
}

class _HorizontalButtonRowState extends State<HorizontalButtonRow> {
  int _selectedIndex = 0; // Track the selected button index

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = index; // Update selected index
                  });
                  // Handle button action based on index
                  switch (index) {
                    case 0:
                      // Handle All Alerts action
                      break;
                    case 1:
                      // Handle High Priority action
                      break;
                    case 2:
                      // Handle Fire Alerts action
                      break;
                    case 3:
                      // Handle Security action
                      break;
                    case 4:
                      // Handle Extra Button action
                      break;
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: _selectedIndex == index ? Colors.white : Colors.black, backgroundColor: _selectedIndex == index ? orange : lightgrey, // Text color
                ),
                child: Text(index == 0 ? 'All Alerts' :
                             index == 1 ? 'High Priority' :
                             index == 2 ? 'Fire Alerts' :
                             index == 3 ? 'Security' :
                             'Extra Button'),
              ),
            );
          })),
        ),
      );
  }
}


class BuildingSelector extends StatefulWidget {
  final List<String> buildings;
  final Function(String) onBuildingSelected;
  final String initialSelection;

  const BuildingSelector({
    Key? key,
    required this.buildings,
    required this.onBuildingSelected,
    this.initialSelection = '',
  }) : super(key: key);

  @override
  State<BuildingSelector> createState() => _BuildingSelectorState();
}

class _BuildingSelectorState extends State<BuildingSelector> {
  // Declare the variable but initialize it in initState
  late String selectedBuilding;

  @override
  void initState() {
    super.initState();
    // Initialize with the initial selection if provided, otherwise use the first building
    selectedBuilding = widget.initialSelection.isNotEmpty 
        ? widget.initialSelection 
        : (widget.buildings.isNotEmpty ? widget.buildings[0] : '');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.buildings.map((building) {
          final isSelected = building == selectedBuilding;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedBuilding = building;
                });
                widget.onBuildingSelected(building);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: isSelected ? Colors.white : Colors.black,
                backgroundColor: isSelected ? orange : lightgrey,
              ),
              child: Text(building),
            ),
          );
        }).toList(),
      ),
    );
  }
}
