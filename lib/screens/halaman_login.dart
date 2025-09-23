import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'sign_in.dart';
import 'sign_up_flow.dart'; // Import sign up

class HalamanLogin extends StatelessWidget {
  const HalamanLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final isDesktop = screenWidth > 1024;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8FAFC),
              Color(0xFFFFFFFF),
              Color(0xFFF1F5F9),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              width: isDesktop ? 600 : (isTablet ? 500 : double.infinity),
              child: Column(
                children: [
                  // Content area yang bisa di-scroll - Back arrow dihilangkan
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 48.0 : 24.0,
                        vertical: 24.0
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: isDesktop ? 40 : 20),
                          
                          // Area Ilustrasi - Responsif untuk semua device
                          Container(
                            width: isDesktop ? 400 : (isTablet ? 350 : screenWidth * 0.75),
                            height: isDesktop ? 300 : (isTablet ? 280 : screenHeight * 0.25),
                            constraints: BoxConstraints(
                              maxWidth: isDesktop ? 400 : 300,
                              maxHeight: isDesktop ? 300 : 220,
                              minWidth: 250,
                              minHeight: 180,
                            ),
                            margin: EdgeInsets.only(bottom: isDesktop ? 48 : 32),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 24,
                                  offset: Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                'assets/images/santai_login.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(
                                      Icons.person_outline,
                                      size: isDesktop ? 120 : 80,
                                      color: Colors.grey.shade400,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          
                          // Title - Font size responsif
                          Text(
                            'Welcome ',
                            style: TextStyle(
                              fontSize: isDesktop ? 42 : (isTablet ? 38 : (screenWidth > 350 ? 32 : 28)),
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: isDesktop ? 20 : 12),

                          Text(
                            'Choose your preferred sign in method',
                            style: TextStyle(
                              fontSize: isDesktop ? 18 : 16,
                              color: Colors.grey.shade600,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: isDesktop ? 64 : 48),

                          // Buttons Container - Max width untuk desktop
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: isDesktop ? 400 : double.infinity,
                            ),
                            child: Column(
                              children: [
                                // Google Login Button - putih dengan border
                                Container(
                                  width: double.infinity,
                                  height: isDesktop ? 64 : 56,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      print('Google login pressed');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Color(0xFF374151),
                                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                                      elevation: 2,
                                      shadowColor: Colors.black.withOpacity(0.1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/logo_google.png',
                                          width: isDesktop ? 24 : 20,
                                          height: isDesktop ? 24 : 20,
                                        ),
                                        const SizedBox(width: 12),
                                        Text(
                                          'Continue with Google',
                                          style: TextStyle(
                                            fontSize: isDesktop ? 18 : 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF374151),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: isDesktop ? 32 : 24),

                                // "or" text
                                Text(
                                  'or',
                                  style: TextStyle(
                                    fontSize: isDesktop ? 16 : 14,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(height: isDesktop ? 32 : 24),

                                // Sign in with password button - merah sesuai tema
                                Container(
                                  width: double.infinity,
                                  height: isDesktop ? 64 : 56,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignInPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFE53E3E),
                                      foregroundColor: Colors.white,
                                      elevation: 4,
                                      shadowColor: Color(0xFFE53E3E).withOpacity(0.3),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      'Sign in with password',
                                      style: TextStyle(
                                        fontSize: isDesktop ? 18 : 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: isDesktop ? 48 : 32),

                          // Sign up link - UPDATED: Dengan navigasi ke SignUpFlow
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: isDesktop ? 16 : 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Navigate to sign up
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUpFlow()),
                                  );
                                },
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Color(0xFF6366F1),
                                    fontSize: isDesktop ? 16 : 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          SizedBox(height: isDesktop ? 60 : 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}