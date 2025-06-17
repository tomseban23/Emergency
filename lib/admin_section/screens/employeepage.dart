import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

const lightgrey2 = Color(0xFFF2F2F2);
const orange = Color(0xFFFFA000);
const lightgrey = Color(0xFFD3D3D3);

class Employee {
  final String name;
  final String position;
  final String department;
  final String? photoUrl;
  bool isActive;
  final bool isAdmin;
  final String email;
  final String phone;

  Employee({
    required this.name,
    required this.position,
    required this.department,
    this.photoUrl,
    required this.isActive,
    required this.isAdmin,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
        'department': department,
        'photoUrl': photoUrl,
        'isActive': isActive,
        'isAdmin': isAdmin,
        'email': email,
        'phone': phone,
      };

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json['name'],
        position: json['position'],
        department: json['department'],
        photoUrl: json['photoUrl'],
        isActive: json['isActive'],
        isAdmin: json['isAdmin'],
        email: json['email'],
        phone: json['phone'],
      );
}

class AddEmployeeScreen extends StatefulWidget {
  final Function(Employee) onEmployeeAdded;
  final Employee? employee;

  const AddEmployeeScreen({Key? key, required this.onEmployeeAdded, this.employee})
      : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String _selectedDepartment = '';
  bool _isAdmin = false;
  String? _photoUrl;
  bool _isActive = true;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _nameController.text = widget.employee!.name;
      _positionController.text = widget.employee!.position;
      _selectedDepartment = widget.employee!.department;
      _photoUrl = widget.employee!.photoUrl;
      _isAdmin = widget.employee!.isAdmin;
      _isActive = widget.employee!.isActive;
      _emailController.text = widget.employee!.email;
      _phoneController.text = widget.employee!.phone;
    }
  }

  Future<void> _selectImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _photoUrl = image.path;
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgrey2,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    widget.employee == null ? 'Add Employee' : 'Edit Employee',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 40),
                const Text(
                  'Profile Photo',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _selectImage,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: _photoUrl == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.cloud_upload,
                                  size: 32,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Click to upload or tap to select image',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(_photoUrl!),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Full Name',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Position',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _positionController,
                  decoration: InputDecoration(
                      filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter job position',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Department',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: InputBorder.none,
                    ),
                    hint: const Text('Select department'),
                    value: _selectedDepartment.isEmpty ? null : _selectedDepartment,
                    items: const [
                      DropdownMenuItem(
                        value: 'Human Resources',
                        child: Text('Human Resources'),
                      ),
                      DropdownMenuItem(
                        value: 'Facilities',
                        child: Text('Facilities'),
                      ),
                      DropdownMenuItem(
                        value: 'Security',
                        child: Text('Security'),
                      ),
                      DropdownMenuItem(
                        value: 'Emergency Response',
                        child: Text('Emergency Response'),
                      ),
                      DropdownMenuItem(
                        value: 'Safety',
                        child: Text('Safety'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedDepartment = value ?? '';
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Email',
                 style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter email address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Phone',
                   style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                ),
      
                if (widget.employee != null) ...[
                  const SizedBox(height: 16),
                  const Text('Employee Status', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),),
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = true;
                          });
                        },
                        activeColor: orange,
                      ),
                      const Text('Active'),
                      Radio<bool>(
                        value: false,
                        groupValue: _isActive,
                        onChanged: (value) {
                          setState(() {
                            _isActive = false;
                          });
                        },
                        activeColor: orange,
                      ),
                      const Text('Inactive'),
                    ],
                  ),
                ],
                const SizedBox(height: 10),
                const Text('Admin Access', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 122, 122, 122)
                  ),),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _isAdmin,
                        onChanged: (value) {
                          setState(() {
                            _isAdmin = value ?? false;
                          });
                        },
                        activeColor: orange,
                        checkColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'is Administrator',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _positionController.text.isNotEmpty &&
                          _selectedDepartment.isNotEmpty) {
                        final newEmployee = Employee(
                          name: _nameController.text,
                          position: _positionController.text,
                          department: _selectedDepartment,
                          photoUrl: _photoUrl,
                          isActive: _isActive,
                          isAdmin: _isAdmin,
                          email: _emailController.text,
                          phone: _phoneController.text,
                        );
                        widget.onEmployeeAdded(newEmployee);
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill out all required fields'),
                          ),
                        );
                      }
                    },
                    child: Text(
                      widget.employee == null ? 'Add Employee' : 'Update Employee',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Employee> _employees = [];
  List<Employee> _filteredEmployees = [];
  final TextEditingController _searchController = TextEditingController();
  String _sortBy = 'Name';

  @override
  void initState() {
    super.initState();
    _loadEmployees();
    _searchController.addListener(_filterEmployees);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _saveEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final employeeList = _employees.map((e) => e.toJson()).toList();
    prefs.setString('employees', jsonEncode(employeeList));
  }

  Future<void> _loadEmployees() async {
    final prefs = await SharedPreferences.getInstance();
    final String? employeeString = prefs.getString('employees');
    if (employeeString != null) {
      final List<dynamic> employeeList = jsonDecode(employeeString);
      setState(() {
        _employees = employeeList.map((e) => Employee.fromJson(e)).toList();
        _filteredEmployees = List.from(_employees);
      });
    }
  }

  void _filterEmployees() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEmployees = _employees.where((employee) {
        return employee.name.toLowerCase().contains(query) ||
               employee.position.toLowerCase().contains(query) ||
               employee.department.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _sortEmployees(String sortBy) {
    setState(() {
      _sortBy = sortBy;
      switch (sortBy) {
        case 'Name':
          _filteredEmployees.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'Position':
          _filteredEmployees.sort((a, b) => a.position.compareTo(b.position));
          break;
        case 'Department':
          _filteredEmployees.sort((a, b) => a.department.compareTo(b.department));
          break;
      }
    });
  }

  void _deleteEmployee(int index) {
    setState(() {
      final employeeToRemove = _filteredEmployees[index];
      _employees.remove(employeeToRemove);
      _filteredEmployees.removeAt(index);
      _saveEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightgrey2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Employees',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text('Add New', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: orange,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEmployeeScreen(
                            onEmployeeAdded: (employee) {
                              setState(() {
                                _employees.add(employee);
                                _searchController.text = ''; // Clear search
                                _filteredEmployees = List.from(_employees);
                                _saveEmployees();
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.file_upload,color: Colors.black,),
                    label: const Text('Bulk Import'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: lightgrey,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.sync),
                    label: const Text('Sync AD'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: lightgrey,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search employees...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Showing ${_filteredEmployees.length} of ${_employees.length} employees'),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: _sortBy,
                    items: const [
                      DropdownMenuItem(value: 'Name', child: Text('Sort by: Name')),
                      DropdownMenuItem(value: 'Position', child: Text('Sort by: Position')),
                      DropdownMenuItem(value: 'Department', child: Text('Sort by: Department')),
                    ],
                    onChanged: (value) {
                      if (value != null) _sortEmployees(value);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredEmployees.length,
                  itemBuilder: (context, index) {
                    final employee = _filteredEmployees[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              // Profile Image - Left aligned
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                  image: employee.photoUrl != null
                                      ? DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(employee.photoUrl!)),
                                        )
                                      : null,
                                ),
                                child: employee.photoUrl == null
                                    ? const Icon(Icons.person, size: 24, color: Colors.white)
                                    : null,
                              ),
                              
                              const SizedBox(width: 12),
                              
                              // Employee Information - Center section
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      employee.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      employee.position,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[500],
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      employee.department,
                                      style: TextStyle(
                                         fontWeight: FontWeight.w600,
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                          decoration: BoxDecoration(
                                            color: employee.isActive ? Colors.green[100] : Colors.red[100],
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            employee.isActive ? 'Active' : 'Inactive',
                                            style: TextStyle(
                                                              color: employee.isActive ? Colors.green[800] : Colors.red[800],
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                     
                                     const SizedBox(width: 8),
                                      if (employee.isAdmin)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                            color: Colors.blue[100],
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Admin',
                                            style: TextStyle(
                                              color: Colors.blue[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                         ],
                                    ),
                                  ],
                                ),
                              ),
                              
                              // Action Buttons - Right aligned
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.chat_bubble_outline, color: Colors.orange[400], size: 22),
                                    onPressed: () {
                                      // Handle chat
                                    },
                                    constraints: const BoxConstraints(),
                                    padding: const EdgeInsets.all(8),
                                  ),
                                  // Use PopupMenuButton instead of manual implementation
                                  PopupMenuButton<String>(
                                    icon: const Icon(Icons.more_vert, color: Colors.black54, size: 22),
                                    padding: const EdgeInsets.all(8),
                                    constraints: const BoxConstraints(),
                                    onSelected: (String item) {
                                      if (item == 'edit') {
                                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEmployeeScreen(
                          employee: employee,
                          onEmployeeAdded: (updatedEmployee) {
                            setState(() {
                              // Replace the employee in _employees and refresh filter
                              final originalIndex = _employees.indexOf(employee);
                              _employees[originalIndex] = updatedEmployee;
                              _filterEmployees();
                              _saveEmployees();
                            });
                          },
                        ),
                      ),
                                        );
                                      } else if (item == 'delete') {
                                        _deleteEmployee(index);
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                      
                                      const PopupMenuItem<String>(
                                        
                                        value: 'edit',
                                        child: Text('Edit'),
                                      ),
                                      const PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}