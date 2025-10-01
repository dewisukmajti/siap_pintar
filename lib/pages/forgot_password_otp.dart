import 'package:flutter/material.dart';
import 'create_new_password.dart';

class ForgotPasswordOtpPage extends StatefulWidget {
  final String method;
  final String contact;

  const ForgotPasswordOtpPage({
    Key? key,
    required this.method,
    required this.contact,
  }) : super(key: key);

  @override
  _ForgotPasswordOtpPageState createState() => _ForgotPasswordOtpPageState();
}

class _ForgotPasswordOtpPageState extends State<ForgotPasswordOtpPage> {
  List<String> otp = List.filled(4, ''); // Changed to 4 digits
  int _countdown = 59;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (_countdown > 0 && mounted) {
        setState(() {
          _countdown--;
        });
        _startCountdown();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _countdown = 59;
      otp = List.filled(4, ''); // Changed to 4 digits
    });
    _startCountdown();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Code has been resent'),
        backgroundColor: Color(0xFFE53E3E),
      ),
    );
  }

  void _handleNumberInput(String number) {
    int emptyIndex = otp.indexWhere((digit) => digit.isEmpty);
    if (emptyIndex != -1) {
      setState(() {
        otp[emptyIndex] = number;
      });

      // Auto verify when all fields are filled
      if (otp.every((digit) => digit.isNotEmpty)) {
        _verifyOtp();
      }
    }
  }

  void _handleBackspace() {
    int lastFilledIndex = otp.lastIndexWhere((digit) => digit.isNotEmpty);
    if (lastFilledIndex != -1) {
      setState(() {
        otp[lastFilledIndex] = '';
      });
    }
  }

  void _verifyOtp() {
    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CreateNewPasswordPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Text(
                'Code has been sent to ${widget.contact}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),

            // OTP Input Fields - 4 digit
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) { // Changed to 4
                return Container(
                  width: 60,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: otp[index].isEmpty ? Colors.grey[300]! : Color(0xFFE53E3E),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[50],
                  ),
                  child: Center(
                    child: Text(
                      otp[index].isEmpty ? '○' : otp[index],
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 24),

            // Countdown Timer
            Center(
              child: Text(
                'Resend code in $_countdown\'s',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),

            SizedBox(height: 40),

            // Custom Number Pad
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [1, 2, 3].map((number) {
                      return _buildNumberButton(number.toString());
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  
                  // Row 2
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [4, 5, 6].map((number) {
                      return _buildNumberButton(number.toString());
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  
                  // Row 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [7, 8, 9].map((number) {
                      return _buildNumberButton(number.toString());
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  
                  // Row 4
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNumberButton('0'),
                      Container(
                        width: 80,
                        height: 60,
                      ),
                      _buildBackspaceButton(),
                    ],
                  ),
                ],
              ),
            ),

            // Resend Code Button
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: _countdown == 0 ? _resendCode : null,
                child: Text(
                  'Resend Code',
                  style: TextStyle(
                    color: _countdown == 0 ? Color(0xFFE53E3E) : Colors.grey,
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
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () => _handleNumberInput(number),
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton() {
    return GestureDetector(
      onTap: _handleBackspace,
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: Colors.grey[600],
            size: 24,
          ),
        ),
      ),
    );
  }
}