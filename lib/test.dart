import 'package:flutter/material.dart';



class EmergencySetupPage extends StatefulWidget {
  const EmergencySetupPage({super.key});

  @override
  State<EmergencySetupPage> createState() => _EmergencySetupPageState();
}

class _EmergencySetupPageState extends State<EmergencySetupPage> {
  int currentStep = 0;
  int completedSteps = 0;
  
  // Organization Info
  String organizationName = 'McDower Inc';
  String? selectedIndustry;
  String contactName = '';
  String contactEmail = '';
  String contactPhone = '';
  bool isOrgInfoComplete = false;
  
  // Site Setup
  List<Site> sites = [];
  bool isSiteSetupComplete = false;
  
  // Area/Building Info
  List<AreaBuilding> areas = [];
  bool isAreaInfoComplete = false;
  
  final List<String> industries = [
    'Manufacturing',
    'Chemical',
    'Education',
    'Healthcare',
    'Construction',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'logo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_outline, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Initial Setup',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Step 4 of 4',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          _buildProgressBar(),
          const SizedBox(height: 20),
          const Text(
            'Welcome, Dave!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Complete these steps to set up your\nemergency alert system.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Setup Progress                    $completedSteps/3 Complete',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.grey[300],
          ),
          child: Row(
            children: [
              Expanded(
                flex: completedSteps,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                flex: 3 - completedSteps,
                child: Container(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildOrganizationSection(),
        const SizedBox(height: 16),
        _buildSiteSetupSection(),
        const SizedBox(height: 16),
        _buildAreaBuildingSection(),
        const SizedBox(height: 32),
        _buildCompleteButton(),
      ],
    );
  }

  Widget _buildOrganizationSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSectionHeader(
            icon: Icons.business_outlined,
            title: 'Organization Info',
            isComplete: isOrgInfoComplete,
            onTap: () => _showOrganizationForm(),
          ),
          if (currentStep == 0 || !isOrgInfoComplete) ...[
            _buildOrganizationForm(),
          ],
        ],
      ),
    );
  }

  Widget _buildSiteSetupSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSectionHeader(
            icon: Icons.location_on_outlined,
            title: 'Site Setup',
            isComplete: isSiteSetupComplete,
            onTap: () => _showSiteForm(),
          ),
          if (sites.isNotEmpty) ..._buildSiteList(),
          if (currentStep == 1 || (!isSiteSetupComplete && sites.isEmpty)) ...[
            _buildSiteForm(),
          ] else if (sites.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildAddButton('Add New Site', _showSiteForm),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAreaBuildingSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSectionHeader(
            icon: Icons.apartment_outlined,
            title: 'Area/Building Info',
            isComplete: isAreaInfoComplete,
            onTap: () => _showAreaForm(),
          ),
          if (!isSiteSetupComplete && sites.isEmpty) ...[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Please add at least one site before adding areas.',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
          ] else if (areas.isNotEmpty) ...[
            ..._buildAreaList(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildAddButton('Add New Area/Building', _showAreaForm),
            ),
          ] else if (currentStep == 2 || !isAreaInfoComplete) ...[
            _buildAreaForm(),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required bool isComplete,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.blue, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isComplete ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                isComplete ? 'Complete' : 'Incomplete',
                style: TextStyle(
                  color: isComplete ? Colors.green : Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganizationForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            label: 'Organization Name',
            value: organizationName,
            onChanged: (value) => setState(() => organizationName = value),
          ),
          const SizedBox(height: 16),
          _buildDropdownField(
            label: 'Industry Type',
            value: selectedIndustry,
            items: industries,
            onChanged: (value) => setState(() => selectedIndustry = value),
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Contact Name',
            value: contactName,
            onChanged: (value) => setState(() => contactName = value),
            placeholder: 'Enter contact name',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Contact Email',
            value: contactEmail,
            onChanged: (value) => setState(() => contactEmail = value),
            placeholder: 'Enter contact email',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Contact Phone',
            value: contactPhone,
            onChanged: (value) => setState(() => contactPhone = value),
            placeholder: 'Enter contact phone',
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: _saveOrganizationInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSiteForm() {
    final siteNameController = TextEditingController();
    final addressLine1Controller = TextEditingController();
    final addressLine2Controller = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final zipController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            label: 'Site Name',
            controller: siteNameController,
            placeholder: 'Enter site name',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Address Line 1',
            controller: addressLine1Controller,
            placeholder: 'Street address',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Address Line 2',
            controller: addressLine2Controller,
            placeholder: 'Apt, suite, building (optional)',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  label: 'City',
                  controller: cityController,
                  placeholder: 'City',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildTextField(
                  label: 'State',
                  controller: stateController,
                  placeholder: 'State',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'ZIP Code',
            controller: zipController,
            placeholder: 'ZIP code',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Contact Email',
            controller: emailController,
            placeholder: 'Contact email address',
          ),
          const SizedBox(height: 16),
          _buildTextField(
            label: 'Contact Phone',
            controller: phoneController,
            placeholder: 'Contact phone number',
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _saveSite(
                  siteNameController.text,
                  addressLine1Controller.text,
                  addressLine2Controller.text,
                  cityController.text,
                  stateController.text,
                  zipController.text,
                  emailController.text,
                  phoneController.text,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Save Site', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAreaForm() {
    final areaNameController = TextEditingController();
    final descriptionController = TextEditingController();
    String? selectedSite;

    return StatefulBuilder(
      builder: (context, setAreaState) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sites.isEmpty) ...[
                const Text(
                  'Please add at least one site before adding areas.',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ] else ...[
                _buildDropdownField(
                  label: 'Select Site',
                  value: selectedSite,
                  items: sites.map((site) => site.name).toList(),
                  onChanged: (value) => setAreaState(() => selectedSite = value),
                  placeholder: 'Choose a site',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Building/Area Name',
                  controller: areaNameController,
                  placeholder: 'Enter building/area name',
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  label: 'Description',
                  controller: descriptionController,
                  placeholder: 'Enter description',
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: selectedSite != null
                          ? () => _saveArea(
                                selectedSite!,
                                areaNameController.text,
                                descriptionController.text,
                              )
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Save Area', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildSiteList() {
    return sites.map((site) => _buildSiteItem(site)).toList();
  }

  Widget _buildSiteItem(Site site) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  site.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  site.address,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  '${site.city}, ${site.state} ${site.zipCode}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: Colors.grey),
              ),
              IconButton(
                onPressed: () => _deleteSite(site),
                icon: const Icon(Icons.delete_outline, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAreaList() {
    return areas.map((area) => _buildAreaItem(area)).toList();
  }

  Widget _buildAreaItem(AreaBuilding area) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  area.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Site: ${area.siteName}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  area.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, color: Colors.grey),
              ),
              IconButton(
                onPressed: () => _deleteArea(area),
                icon: const Icon(Icons.delete_outline, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    String? value,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    String? placeholder,
    int maxLines = 1,
  }) {
    final effectiveController = controller ?? TextEditingController(text: value);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: effectiveController,
          onChanged: onChanged,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey[400]),
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
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    String? value,
    required List<String> items,
    ValueChanged<String?>? onChanged,
    String? placeholder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: placeholder ?? 'Select $label',
            hintStyle: TextStyle(color: Colors.grey[400]),
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
              borderSide: const BorderSide(color: Colors.blue),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton(String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.blue, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteButton() {
    final isComplete = completedSteps == 3;
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isComplete ? _completeSetup : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isComplete ? Colors.blue : Colors.grey[300],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'Complete Setup',
          style: TextStyle(
            color: isComplete ? Colors.white : Colors.grey[600],
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showOrganizationForm() {
    setState(() => currentStep = 0);
  }

  void _showSiteForm() {
    setState(() => currentStep = 1);
  }

  void _showAreaForm() {
    setState(() => currentStep = 2);
  }

  void _saveOrganizationInfo() {
    if (organizationName.isNotEmpty &&
        selectedIndustry != null &&
        contactName.isNotEmpty &&
        contactEmail.isNotEmpty &&
        contactPhone.isNotEmpty) {
      setState(() {
        isOrgInfoComplete = true;
        if (completedSteps < 1) completedSteps = 1;
        currentStep = 1;
      });
    }
  }

  void _saveSite(String name, String address1, String address2, String city, String state, String zip, String email, String phone) {
    if (name.isNotEmpty && address1.isNotEmpty && city.isNotEmpty && state.isNotEmpty && zip.isNotEmpty) {
      setState(() {
        sites.add(Site(
          name: name,
          address: address1,
          city: city,
          state: state,
          zipCode: zip,
          email: email,
          phone: phone,
        ));
        isSiteSetupComplete = true;
        if (completedSteps < 2) completedSteps = 2;
        currentStep = 2;
      });
    }
  }

  void _saveArea(String siteName, String areaName, String description) {
    if (siteName.isNotEmpty && areaName.isNotEmpty) {
      setState(() {
        areas.add(AreaBuilding(
          siteName: siteName,
          name: areaName,
          description: description,
        ));
        isAreaInfoComplete = true;
        if (completedSteps < 3) completedSteps = 3;
      });
    }
  }

  void _deleteSite(Site site) {
    setState(() {
      sites.remove(site);
      areas.removeWhere((area) => area.siteName == site.name);
      if (sites.isEmpty) {
        isSiteSetupComplete = false;
        completedSteps = 1;
      }
      if (areas.isEmpty) {
        isAreaInfoComplete = false;
        if (completedSteps > 2) completedSteps = 2;
      }
    });
  }

  void _deleteArea(AreaBuilding area) {
    setState(() {
      areas.remove(area);
      if (areas.isEmpty) {
        isAreaInfoComplete = false;
        if (completedSteps > 2) completedSteps = 2;
      }
    });
  }

  void _completeSetup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Setup Complete!'),
        content: const Text('Your emergency alert system has been successfully configured.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class Site {
  final String name;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String email;
  final String phone;

  Site({
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.email,
    required this.phone,
  });
}

class AreaBuilding {
  final String siteName;
  final String name;
  final String description;

  AreaBuilding({
    required this.siteName,
    required this.name,
    required this.description,
  });
}