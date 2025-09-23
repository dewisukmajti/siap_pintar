import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'edit_profile_pages.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  final String email;

  ProfileScreen({required this.username, required this.email});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;
  File? _profileImage;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showLogoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Are you sure you want to log out?",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Logged out")),
                        );
                      },
                      child: Text("Yes, Logout"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                          child: _profileImage == null
                              ? Icon(Icons.person,
                                  size: 25, color: Colors.white)
                              : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            padding: EdgeInsets.all(3),
                            child: Icon(Icons.camera_alt,
                                size: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(widget.username,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text(widget.email, style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          GestureDetector(
            onTap: _pickImage,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : null,
                  child: _profileImage == null
                      ? Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.edit, size: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(widget.username,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(widget.email,
              style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          SizedBox(height: 20),
          Divider(
              thickness: 1, color: Colors.grey[300], indent: 20, endIndent: 20),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(Icons.edit_outlined, 'Edit Profile', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfileScreen()),
                  );
                }),
                _buildMenuItem(Icons.notifications_outlined, 'Notification'),
                _buildMenuItem(Icons.payment_outlined, 'Payment'),
                _buildMenuItem(Icons.security_outlined, 'Security'),
                _buildMenuItem(Icons.language_outlined, 'Language – English (US)'),
                _buildDarkModeToggle(),
                _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
                _buildMenuItem(Icons.help_outline, 'Help Center'),
                _buildMenuItem(Icons.group_add_outlined, 'Invite Friends'),
                Divider(
                    thickness: 1,
                    color: Colors.grey[300],
                    indent: 20,
                    endIndent: 20),
                _buildMenuItem(Icons.logout_outlined, 'Logout',
                    color: Colors.red, onTap: _showLogoutBottomSheet),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Course'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Inbox'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: 'Transaction'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title,
      {VoidCallback? onTap, Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: color != null ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildDarkModeToggle() {
    return ListTile(
      leading: Icon(Icons.dark_mode_outlined),
      title: Text('Dark Mode'),
      trailing: Switch(
        value: isDarkMode,
        onChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
      ),
    );
  }
}
