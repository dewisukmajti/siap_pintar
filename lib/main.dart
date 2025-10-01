import 'package:flutter/material.dart';
import 'pages/profile_pages.dart';  // Import yang diperlukan
import 'pages/edit_profile_pages.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/halaman_login.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up_flow.dart';
import 'pages/home_page.dart'; // Import home_page.dart yang sebenarnya
import 'pages/notification_page.dart';
import 'pages/forgot_pasword.dart'; // TAMBAHKAN IMPORT INI
import 'pages/forgot_password_otp.dart'; // TAMBAHKAN IMPORT INI
import 'pages/create_new_password.dart'; // TAMBAHKAN IMPORT INI
import 'pages/success.dart'; // TAMBAHKAN IMPORT INI

void main() {
  runApp(SiapPintarApp());
}

class SiapPintarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siap Pintar App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/welcome': (context) => const HalamanLogin(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpFlow(),
        '/home': (context) => const CustomBottomNavBar(),
        '/edit': (context) =>  EditProfileScreen(),
        '/notification': (context) => const NotificationPage(),
        // TAMBAHKAN ROUTES FORGOT PASSWORD DI SINI
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/forgot-password-otp': (context) => ForgotPasswordOtpPage(method: '', contact: ''),
        '/create-new-password': (context) => const CreateNewPasswordPage(),
        '/password-success': (context) => const PasswordResetSuccessPage(),
      },
    );
  }
}

// ===== CUSTOM BOTTOM NAVBAR =====
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(), 
    const MyCoursePage(),
    const InboxPage(),
    const TranscriptPage(),
    const ProfilePages(
      username: "Andrew Ainsley", 
      email: "andrew@example.com",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFFE53E3E),
          unselectedItemColor: const Color(0xFF9CA3AF),
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              activeIcon: Icon(Icons.play_circle),
              label: 'My Course',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              activeIcon: Icon(Icons.chat_bubble),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              activeIcon: Icon(Icons.description),
              label: 'Transcript',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Course'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle, size: 80, color: Color(0xFFE53E3E)),
            SizedBox(height: 16),
            Text(
              'My Course Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble, size: 80, color: Color(0xFFE53E3E)),
            SizedBox(height: 16),
            Text(
              'Inbox Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class TranscriptPage extends StatelessWidget {
  const TranscriptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transcript'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.description, size: 80, color: Color(0xFFE53E3E)),
            SizedBox(height: 16),
            Text(
              'Transcript Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}