import 'package:flutter/material.dart';
import 'dart:async';
import 'notification_page.dart';
import 'most_popular_courses_page.dart';
import 'search_page.dart';
import 'course_detail_page.dart';

// SLIDE CAROUSEL WIDGET
class SlideCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> banners;
  final double height;
  final Duration autoScrollDuration;

  const SlideCarousel({
    Key? key,
    required this.banners,
    this.height = 180,
    this.autoScrollDuration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<SlideCarousel> createState() => _SlideCarouselState();
}

class _SlideCarouselState extends State<SlideCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _bannerTimer;
  int _infiniteIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.banners.length * 100,
    );
    _currentPage = widget.banners.length * 100;
    _infiniteIndex = widget.banners.length * 100 % widget.banners.length;
    _startBannerTimer();
  }

  void _startBannerTimer() {
    _bannerTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _bannerTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _infiniteIndex = index % widget.banners.length;
              });
            },
            itemBuilder: (context, index) {
              final banner = widget.banners[index % widget.banners.length];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[400]!,
                      Colors.blue[600]!,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    banner['title'] ?? 'Banner ${(index % widget.banners.length) + 1}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _infiniteIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _infiniteIndex == index ? const Color(0xFFE53E3E) : Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  final List<String> categories = ['All', '3D Design', 'Business', 'Programming'];

  // Data untuk banners
  final List<Map<String, dynamic>> banners = [
    {'title': 'Learn New Skills', 'subtitle': 'Start your journey today'},
    {'title': 'Exclusive Offers', 'subtitle': 'Limited time promotion'},
    {'title': 'Expert Mentors', 'subtitle': 'Learn from the best'},
  ];

  // Data untuk mentors dengan gambar
  final List<Map<String, String>> mentors = [
    {'name': 'Joanna', 'image': 'assets/images/mentor1.png'},
    {'name': 'Jacob', 'image': 'assets/images/mentor2.png'},
    {'name': 'Michella', 'image': 'assets/images/mentor3.png'},
    {'name': 'Wade', 'image': 'assets/images/mentor4.png'},
    {'name': 'Andrew', 'image': 'assets/images/mentor5.png'},
  ];

  // Data untuk semua mentors
  final List<Map<String, String>> allMentors = [
    {'name': 'Jacob Kulikowski', 'position': 'Marketing Analyst', 'image': 'assets/images/mentor1.png'},
    {'name': 'Claire Ordonez', 'position': 'VP of Sales', 'image': 'assets/images/mentor2.png'},
    {'name': 'Priscilla Ehrman', 'position': 'UX Designer', 'image': 'assets/images/mentor3.png'},
    {'name': 'Wade Chenail', 'position': 'Manager, Solution Engineering', 'image': 'assets/images/mentor4.png'},
    {'name': 'Kathryn Pera', 'position': 'Product Manager', 'image': 'assets/images/mentor5.png'},
    {'name': 'Francene Vandyne', 'position': 'EVP and GM, Sales Cloud', 'image': 'assets/images/mentor1.png'},
    {'name': 'Benny Spanbauer', 'position': 'Senior Product Manager', 'image': 'assets/images/mentor2.png'},
    {'name': 'Jamel Eusebio', 'position': 'Product Designer', 'image': 'assets/images/mentor3.png'},
    {'name': 'Cyndy Lillibridge', 'position': 'VP of Marketing', 'image': 'assets/images/mentor4.png'},
    {'name': 'Titus Kitamura', 'position': '', 'image': 'assets/images/mentor5.png'},
  ];

  // Data untuk courses dengan gambar
  final List<Map<String, String>> courses = [
    {
      'title': '3D Design Illustration',
      'price': '\$48',
      'oldPrice': '\$68',
      'rating': '4.8',
      'students': '8.9K students',
      'image': 'assets/images/course1.png',
      'category': '3D Design',
      'bookmark': 'false',
    },
    {
      'title': 'Digital Entrepreneur...',
      'price': '\$39',
      'oldPrice': '',
      'rating': '4.6',
      'students': '4.182 students',
      'image': 'assets/images/course2.png',
      'category': 'Business',
      'bookmark': 'true',
    },
    {
      'title': 'Learn UX User Persona',
      'price': '\$42',
      'oldPrice': '\$75',
      'rating': '4.7',
      'students': '1.798 students',
      'image': 'assets/images/course3.png',
      'category': 'UI/UX Design',
      'bookmark': 'false',
    },
  ];

  Widget _buildCourseCard(
    String title,
    String price,
    String oldPrice,
    String rating,
    String students,
    String imagePath,
    String category,
    {bool showBookmark = false}
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CourseDetailPage(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey[400],
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEE2E2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE53E3E),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _getCategoryIcon(category),
                                size: 12,
                                color: const Color(0xFFE53E3E),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                category,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFE53E3E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          showBookmark ? Icons.bookmark : Icons.bookmark_border,
                          size: 20,
                          color: const Color(0xFFE53E3E),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE53E3E),
                          ),
                        ),
                        if (oldPrice.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            oldPrice,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '| $students',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case '3D Design':
        return Icons.view_in_ar_outlined;
      case 'Business':
        return Icons.trending_up;
      case 'UI/UX Design':
        return Icons.brush_outlined;
      default:
        return Icons.category_outlined;
    }
  }

  List<Map<String, String>> _getFilteredCourses() {
    if (selectedCategory == 'All') {
      return courses;
    }
    return courses.where((course) => course['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER SECTION
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/mentor5.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[600],
                            ),
                          );
                        },
                      ),
                    ),
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
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {
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
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {},
                    iconSize: 28,
                  ),
                ],
              ),
            ),

            // SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            enabled: false,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey[500],
                              ),
                              suffixIcon: const Icon(
                                Icons.tune,
                                color: Color(0xFFE53E3E),
                              ),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[100]!,
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey[100]!,
                                  width: 1,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // SLIDE CAROUSEL - BARU
                      SlideCarousel(
                        banners: banners,
                        height: 160,
                        autoScrollDuration: const Duration(seconds: 3),
                      ),
                      const SizedBox(height: 24),

                      // Top Mentors Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Top Mentors',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TopMentorsPage(mentors: allMentors),
                                ),
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xFFE53E3E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Top Mentors List
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mentors.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                        width: 2,
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        mentors[index]['image']!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey[300],
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.grey[600],
                                              size: 30,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    mentors[index]['name']!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Most Popular Courses Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Most Popular Courses',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MostPopularCoursesPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xFFE53E3E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Category Chips
                      SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: categories.map((category) {
                            final isSelected = selectedCategory == category;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = category;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFFE53E3E) : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFFE53E3E),
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    category,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : const Color(0xFFE53E3E),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Popular Courses List
                      ..._getFilteredCourses().map((course) {
                        return Column(
                          children: [
                            _buildCourseCard(
                              course['title']!,
                              course['price']!,
                              course['oldPrice']!,
                              course['rating']!,
                              course['students']!,
                              course['image']!,
                              course['category']!,
                              showBookmark: course['bookmark'] == 'true',
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TOP MENTORS PAGE
class TopMentorsPage extends StatelessWidget {
  final List<Map<String, String>> mentors;

  const TopMentorsPage({
    super.key,
    required this.mentors,
  });

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
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          return MentorCard(
            name: mentors[index]['name']!,
            position: mentors[index]['position']!,
            image: mentors[index]['image']!,
          );
        },
      ),
    );
  }
}

// MENTOR CARD WIDGET
class MentorCard extends StatelessWidget {
  final String name;
  final String position;
  final String image;

  const MentorCard({
    super.key,
    required this.name,
    required this.position,
    required this.image,
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
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person,
                      color: Colors.grey[500],
                      size: 30,
                    );
                  },
                ),
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
            IconButton(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}