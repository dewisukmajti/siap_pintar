import 'package:flutter/material.dart';
import 'halaman_login.dart'; // Import halaman login

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/laptop.png',
      'title': 'Learn Better with Expert Mentors',
      'subtitle': 'Get direct guidance from experienced teachers in their fields',
    },
    {
      'image': 'assets/images/phone.png',
      'title': 'Access Learning Materials Anytime, Anywhere',
      'subtitle': 'Full flexibility to learn according to your schedule',
    },
    {
      'image': 'assets/images/certificate.png',
      'title': 'Improve Your Skills with siap pintar Now!',
      'subtitle': 'Achieve accomplishments and certificates for a better future',
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      setState(() {
        _currentPage++;
      });
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigasi ke halaman login
      _goToLogin();
    }
  }

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HalamanLogin()),
    );
  }

  // Method untuk menentukan device type
  DeviceType _getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return DeviceType.mobile;
    } else if (width < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  // Method untuk mendapatkan responsive values
  ResponsiveValues _getResponsiveValues(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final DeviceType deviceType = _getDeviceType(context);
    final double width = screenSize.width;
    final double height = screenSize.height;

    switch (deviceType) {
      case DeviceType.mobile:
        return ResponsiveValues(
          imageHeight: height * 0.30,
          titleFontSize: width * 0.055,
          subtitleFontSize: width * 0.032,
          buttonHeight: height * 0.065,
          buttonFontSize: width * 0.038,
          horizontalPadding: width * 0.05,
          verticalSpacing: height * 0.03,
          maxWidth: double.infinity,
        );
      case DeviceType.tablet:
        return ResponsiveValues(
          imageHeight: 280,
          titleFontSize: 26,
          subtitleFontSize: 15,
          buttonHeight: 60,
          buttonFontSize: 17,
          horizontalPadding: 50,
          verticalSpacing: 35,
          maxWidth: 600,
        );
      case DeviceType.desktop:
        return ResponsiveValues(
          imageHeight: 320,
          titleFontSize: 30,
          subtitleFontSize: 17,
          buttonHeight: 65,
          buttonFontSize: 19,
          horizontalPadding: 70,
          verticalSpacing: 45,
          maxWidth: 800,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ResponsiveValues responsive = _getResponsiveValues(context);
    final DeviceType deviceType = _getDeviceType(context);
    final bool isDesktop = deviceType == DeviceType.desktop;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: responsive.maxWidth),
            child: Column(
              children: [
                // Skip button - UPDATED: Navigasi ke halaman login
                Padding(
                  padding: EdgeInsets.all(responsive.horizontalPadding * 0.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Langsung ke halaman login
                          _goToLogin();
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: responsive.subtitleFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Page content - Fixed layout
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsive.horizontalPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: responsive.verticalSpacing),
                          
                          // Image only - Simple and clean
                          Container(
                            width: double.infinity,
                            height: responsive.imageHeight,
                            child: Image.asset(
                              onboardingData[_currentPage]['image']!,
                              height: responsive.imageHeight,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: responsive.imageHeight,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_not_supported,
                                          size: 60,
                                          color: Colors.grey[400],
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'Image not found',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          
                          SizedBox(height: responsive.verticalSpacing * 1.2),
                          
                          // Title - Fixed overflow
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 40 : 16,
                            ),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                onboardingData[_currentPage]['title']!,
                                key: ValueKey(_currentPage),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: responsive.titleFontSize,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFF2D3748),
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: responsive.verticalSpacing * 0.5),
                          
                          // Subtitle - Fixed overflow
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 60 : 20,
                            ),
                            constraints: BoxConstraints(
                              maxWidth: isDesktop ? 700 : double.infinity,
                            ),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Text(
                                onboardingData[_currentPage]['subtitle']!,
                                key: ValueKey('subtitle_$_currentPage'),
                                textAlign: TextAlign.center,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: responsive.subtitleFontSize,
                                  color: Colors.grey[600],
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          
                          SizedBox(height: responsive.verticalSpacing * 1.5),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Indicator dots
                Padding(
                  padding: EdgeInsets.symmetric(vertical: responsive.verticalSpacing * 0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) {
                        final bool isActive = _currentPage == index;
                        final double dotSize = isDesktop ? 10 : 8;
                        final double activeWidth = isDesktop ? 40 : 32;
                        
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: isActive ? activeWidth : dotSize * 1.5,
                          height: dotSize,
                          decoration: BoxDecoration(
                            color: isActive 
                                ? const Color(0xFFE53E3E) 
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(dotSize / 2),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                // Button - UPDATED: Navigasi ke halaman login
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    responsive.horizontalPadding,
                    0,
                    responsive.horizontalPadding,
                    responsive.verticalSpacing,
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 400 : double.infinity,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: responsive.buttonHeight,
                      child: ElevatedButton(
                        onPressed: _nextPage, // Ini akan panggil _goToLogin() di halaman terakhir
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE53E3E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(responsive.buttonHeight / 2),
                          ),
                          elevation: isDesktop ? 8 : 6,
                          shadowColor: const Color(0xFFE53E3E).withOpacity(0.4),
                        ),
                        child: Text(
                          _currentPage == onboardingData.length - 1 
                              ? 'Get Started' 
                              : 'Next',
                          style: TextStyle(
                            fontSize: responsive.buttonFontSize,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// Enum untuk device types
enum DeviceType { mobile, tablet, desktop }

// Class untuk menyimpan responsive values
class ResponsiveValues {
  final double imageHeight;
  final double titleFontSize;
  final double subtitleFontSize;
  final double buttonHeight;
  final double buttonFontSize;
  final double horizontalPadding;
  final double verticalSpacing;
  final double maxWidth;

  ResponsiveValues({
    required this.imageHeight,
    required this.titleFontSize,
    required this.subtitleFontSize,
    required this.buttonHeight,
    required this.buttonFontSize,
    required this.horizontalPadding,
    required this.verticalSpacing,
    required this.maxWidth,
  });
}