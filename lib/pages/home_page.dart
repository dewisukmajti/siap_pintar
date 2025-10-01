import 'package:flutter/material.dart';
import 'notification_page.dart'; // Import halaman notifikasi

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Good Morning ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const Text('👋'),
                            ],
                          ),
                          const Text(
                            'Andrew Ainsley',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Tombol Notifikasi - Ditambahkan navigasi
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {
                        // Navigasi ke halaman notifikasi
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationPage(),
                          ),
                        );
                      },
                      iconSize: 28,
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark_outline),
                      onPressed: () {},
                      iconSize: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[400]),
                      const SizedBox(width: 12),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: Colors.blue[600],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Today's Special Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue[400]!,
                        Colors.blue[600]!,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Stack(
                    children: [
                      // Decorative circles
                      Positioned(
                        right: -20,
                        top: -20,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 60,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              '40% OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Text(
                                'Today\'s Special',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '40%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 56,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Get a discount for every course order!\nOnly valid for today!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Dots indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              5,
                              (index) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                width: index == 0 ? 24 : 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                    index == 0 ? 1.0 : 0.4,
                                  ),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}