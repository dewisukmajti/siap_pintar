import 'package:flutter/material.dart';


class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Today Section
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildNotificationItem(
            icon: Icons.credit_card,
            iconColor: const Color(0xFF4F46E5),
            backgroundColor: const Color(0xFFEEF2FF),
            title: 'Payment Successful!',
            subtitle: 'You have made a course payment',
          ),
          
          const SizedBox(height: 12),
          
          _buildNotificationItem(
            icon: Icons.local_offer,
            iconColor: const Color(0xFFF59E0B),
            backgroundColor: const Color(0xFFFEF3C7),
            title: 'Today\'s Special Offers',
            subtitle: 'You get a special promo today!',
          ),
          
          const SizedBox(height: 24),
          
          // Yesterday Section
          const Text(
            'Yesterday',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildNotificationItem(
            icon: Icons.category,
            iconColor: const Color(0xFFEC4899),
            backgroundColor: const Color(0xFFFCE7F3),
            title: 'New Category Courses!',
            subtitle: 'Now the 3D design course is available',
          ),
          
          const SizedBox(height: 12),
          
          _buildNotificationItem(
            icon: Icons.credit_card,
            iconColor: const Color(0xFF4F46E5),
            backgroundColor: const Color(0xFFEEF2FF),
            title: 'Credit Card Connected!',
            subtitle: 'Credit Card has been linked!',
          ),
          
          const SizedBox(height: 24),
          
          // December 22, 2024 Section
          const Text(
            'December 22, 2024',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildNotificationItem(
            icon: Icons.person,
            iconColor: const Color(0xFF10B981),
            backgroundColor: const Color(0xFFD1FAE5),
            title: 'Account Setup Successful!',
            subtitle: 'Your account has been created!',
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Icon with decorative circles
          Stack(
            alignment: Alignment.center,
            children: [
              // Outer circle
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor.withOpacity(0.3),
                ),
              ),
              // Inner circle with icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: backgroundColor,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              // Small decorative dots
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 0,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: -5,
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}