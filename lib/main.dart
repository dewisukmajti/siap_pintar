import 'package:flutter/material.dart';
import 'pages/profile_pages.dart';
import 'pages/edit_profile_pages.dart';
import 'pages/home_page.dart';
import 'pages/notification_page.dart';
import 'pages/my_courses_page.dart'; 
import 'pages/forgot_pasword.dart';
import 'pages/forgot_password_otp.dart';
import 'pages/create_new_password.dart';
import 'pages/success.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/halaman_login.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up_flow.dart';
import 'pages/forget_password_email.dart'; 
import 'pages/transactions_page.dart'; 

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
        scaffoldBackgroundColor: Colors.white, // SET BACKGROUND GLOBAL KE PUTIH
      ),
      home: const SplashScreen(),
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/welcome': (context) => const HalamanLogin(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpFlow(),
        '/home': (context) => const CustomBottomNavBar(),
        '/edit': (context) => EditProfileScreen(),
        '/notification': (context) => const NotificationPage(),
        '/forgot-password-email': (context) => const ForgotPasswordScreen(),
        '/forgot-password': (context) => const ForgotPasswordPage(),
        '/forgot-password-otp': (context) => ForgotPasswordOtpPage(method: '', contact: ''),
        '/create-new-password': (context) => const CreateNewPasswordPage(),
        '/password-success': (context) => const PasswordResetSuccessPage(),
        '/transactions': (context) => const TransactionsPage(), // TAMBAHKAN ROUTE INI
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
    const MyCoursesPage(),
    const InboxPage(),
    const TransactionsPage(), // GANTI TranscriptPage DENGAN TransactionsPage
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
              icon: Icon(Icons.receipt_long_outlined), // GANTI ICON
              activeIcon: Icon(Icons.receipt_long), // GANTI ICON
              label: 'Transactions', // GANTI LABEL
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

// ===== PLACEHOLDER PAGES (yang belum dibuat) =====

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // BACKGROUND PUTIH
      appBar: AppBar(
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
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

// HAPUS TranscriptPage KARENA SUDAH DIGANTI DENGAN TransactionsPage