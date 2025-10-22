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

  // Validation errors
  Map<String, String?> validationErrors = {
    'fullName': null,
    'firstName': null,
    'dateOfBirth': null,
    'email': null,
    'country': null,
    'phoneNumber': null,
    'gender': null,
    'status': null,
  };

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

  @override
  void initState() {
    super.initState();
    // Add listeners to clear validation errors when user starts typing
    fullNameController.addListener(() => _clearError('fullName'));
    firstNameController.addListener(() => _clearError('firstName'));
    emailController.addListener(() => _clearError('email'));
    phoneController.addListener(() => _clearError('phoneNumber'));
  }

  void _clearError(String field) {
    if (validationErrors[field] != null) {
      setState(() {
        validationErrors[field] = null;
      });
    }
  }

  bool _validateForm() {
    setState(() {
      validationErrors = {
        'fullName': fullNameController.text.isEmpty ? 'Full Name is required' : null,
        'firstName': firstNameController.text.isEmpty ? 'First Name is required' : null,
        'dateOfBirth': selectedDate == null ? 'Date of Birth is required' : null,
        'email': emailController.text.isEmpty ? 'Email Address is required' : null,
        'country': selectedCountry == null ? 'Country is required' : null,
        'phoneNumber': phoneController.text.isEmpty ? 'Phone Number is required' : null,
        'gender': selectedGender == null ? 'Gender is required' : null,
        'status': selectedStatus == null ? 'Status is required' : null,
      };
    });

    return !validationErrors.values.any((error) => error != null);
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Column(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 48,
              ),
              SizedBox(height: 16),
              Text(
                'Success!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          content: Text(
            'Profile updated successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          actions: [
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE53E3E),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Go back to previous screen
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
        validationErrors['dateOfBirth'] = null;
      });
    }
  }

  Widget _buildErrorText(String? error) {
    if (error == null) return SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(top: 4),
      child: Text(
        error,
        style: TextStyle(
          color: Colors.red,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // DIUBAH: Background putih
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
     // BOTTOM NAVIGATION BAR DENGAN TOMBOL UPDATE - SESUAI CONTOH
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE53E3E), // Warna merah seperti tema app
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          onPressed: () {
            if (_validateForm()) {
              _showSuccessDialog();
            }
          },
          child: const Text(
            "Update",
            style: TextStyle(
              fontSize: 16, 
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['fullName'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                      ),
                    ),
                    _buildErrorText(validationErrors['fullName']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['firstName'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                      ),
                    ),
                    _buildErrorText(validationErrors['firstName']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['dateOfBirth'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                    _buildErrorText(validationErrors['dateOfBirth']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['email'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                      ),
                    ),
                    _buildErrorText(validationErrors['email']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['country'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                            validationErrors['country'] = null;
                          });
                        },
                      ),
                    ),
                    _buildErrorText(validationErrors['country']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['phoneNumber'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                    _buildErrorText(validationErrors['phoneNumber']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['gender'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                        items: ['Male', 'Female']
                            .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                            validationErrors['gender'] = null;
                          });
                        },
                      ),
                    ),
                    _buildErrorText(validationErrors['gender']),
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
                        color: Color(0xFFF8F9FA), // DIUBAH: Abu-abu terang
                        borderRadius: BorderRadius.circular(8),
                        border: Border(
                          bottom: BorderSide(
                            color: validationErrors['status'] != null 
                                ? Colors.red 
                                : Colors.grey[300]!, 
                            width: 1
                          ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        ),
                        icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
                        items: ['Student', 'Teacher', 'Professional']
                            .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value;
                            validationErrors['status'] = null;
                          });
                        },
                      ),
                    ),
                    _buildErrorText(validationErrors['status']),
                  ],
                ),
                
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fullNameController.dispose();
    firstNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}