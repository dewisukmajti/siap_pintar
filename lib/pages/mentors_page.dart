import 'package:flutter/material.dart';

// Top Mentors Page
class TopMentorsPage extends StatelessWidget {
  const TopMentorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Top Mentors',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 28,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MentorCard(
            name: 'Joanna',
            position: 'Marketing Analyst',
            image: 'assets/images/mentor1.png',
          ),
          MentorCard(
            name: 'Jacob',
            position: 'VP of Sales',
            image: 'assets/images/mentor2.png',
          ),
          MentorCard(
            name: 'Michella',
            position: 'UX Designer',
            image: 'assets/images/mentor3.png',
          ),
          MentorCard(
            name: 'Wade',
            position: 'Manager, Solution Engineering',
            image: 'assets/images/mentor4.png',
          ),
          MentorCard(
            name: 'Andrew',
            position: 'Product Manager',
            image: 'assets/images/mentor5.png',
          ),
          MentorCard(
            name: 'Francene Vandyne',
            position: 'EVP and GM, Sales Cloud',
          ),
          MentorCard(
            name: 'Benny Spanbauer',
            position: 'Senior Product Manager',
          ),
          MentorCard(
            name: 'Jamel Eusebio',
            position: 'Product Designer',
          ),
          MentorCard(
            name: 'Cyndy Lillibridge',
            position: 'VP of Marketing',
          ),
          MentorCard(
            name: 'Titus Kitamura',
            position: '',
          ),
        ],
      ),
    );
  }
}

class MentorCard extends StatelessWidget {
  final String name;
  final String position;
  final String? image;

  const MentorCard({
    super.key,
    required this.name,
    required this.position,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Container untuk profile picture/avatar
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        image!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.person,
                            color: Colors.grey[500],
                            size: 30,
                          );
                        },
                      ),
                    )
                  : Icon(
                      Icons.person,
                      color: Colors.grey[500],
                      size: 30,
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (position.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      position,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            // Chat Outline Icon di sebelah kanan
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFE53E3E),
                  width: 1.5,
                ),
              ),
              child: const Icon(
                Icons.chat_bubble_outline,
                color: Color(0xFFE53E3E),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}