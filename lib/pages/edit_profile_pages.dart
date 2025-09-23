import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCountry;
  String? selectedGender;
  String? selectedStatus;
  DateTime? selectedDate;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Map negara dengan kode negara dan emoji bendera
  final Map<String, Map<String, String>> countries = {
    'United States': {'code': '+1', 'flag': '🇺🇸'},
    'Indonesia': {'code': '+62', 'flag': '🇮🇩'},
    'Japan': {'code': '+81', 'flag': '🇯🇵'},
    'United Kingdom': {'code': '+44', 'flag': '🇬🇧'},
    'Germany': {'code': '+49', 'flag': '🇩🇪'},
    'France': {'code': '+33', 'flag': '🇫🇷'},
    'Australia': {'code': '+61', 'flag': '🇦🇺'},
    'Canada': {'code': '+1', 'flag': '🇨🇦'},
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Full Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: TextFormField(
                        controller: fullNameController,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // First Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'First Name',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: TextFormField(
                        controller: firstNameController,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Date of Birth
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date of Birth',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.grey[600],
                                size: 20,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                            ),
                            controller: TextEditingController(
                              text: selectedDate == null
                                  ? ''
                                  : '${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Email Address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Country
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedCountry,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                        items: countries.keys.map((String country) {
                          return DropdownMenuItem<String>(
                            value: country,
                            child: Row(
                              children: [
                                Text(
                                  countries[country]!['flag']!,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: 8),
                                Text(country),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCountry = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Phone Number with Country Selector
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: Row(
                        children: [
                          // Country Selector
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.grey[300]!, width: 1),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCountry,
                                hint: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('🌍', style: TextStyle(fontSize: 18)),
                                    SizedBox(width: 4),
                                    Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey[600]),
                                  ],
                                ),
                                items: countries.keys.map((String country) {
                                  return DropdownMenuItem<String>(
                                    value: country,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          countries[country]!['flag']!,
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          countries[country]!['code']!,
                                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCountry = newValue;
                                    if (newValue != null) {
                                      // Auto set kode negara di phone number
                                      String countryCode = countries[newValue]!['code']!;
                                      String currentPhone = phoneController.text;
                                      
                                      // Hapus kode negara lama jika ada
                                      for (String code in countries.values.map((e) => e['code']!)) {
                                        if (currentPhone.startsWith(code)) {
                                          currentPhone = currentPhone.substring(code.length).trim();
                                          break;
                                        }
                                      }
                                      
                                      phoneController.text = '$countryCode $currentPhone';
                                    }
                                  });
                                },
                                icon: Container(),
                                isDense: true,
                              ),
                            ),
                          ),
                          
                          // Phone Number Input
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Gender
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                            .toList(),
                        onChanged: (value) => setState(() => selectedGender = value),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: selectedStatus,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                        items: ['Student', 'Teacher', 'Professional']
                            .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                            .toList(),
                        onChanged: (value) => setState(() => selectedStatus = value),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),

                // Update Button
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE53E3E),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 2,
                      shadowColor: Color(0xFFE53E3E).withOpacity(0.3),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle update profile
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Profile updated successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}