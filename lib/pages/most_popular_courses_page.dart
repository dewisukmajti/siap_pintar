import 'package:flutter/material.dart';
import 'course_detail_page.dart'; // Import CourseDetailPage

class MostPopularCoursesPage extends StatefulWidget {
  const MostPopularCoursesPage({Key? key}) : super(key: key);

  @override
  State<MostPopularCoursesPage> createState() => _MostPopularCoursesPageState();
}

class _MostPopularCoursesPageState extends State<MostPopularCoursesPage> {
  String selectedCategory = 'All';
  
  final List<String> categories = ['All', '3D Design', 'Business', 'Programming'];
  
  final List<Map<String, dynamic>> allCourses = [
    {
      'title': '3D Design Illustration',
      'price': '\$48',
      'oldPrice': '\$68',
      'rating': '4.8',
      'students': '8.817 students',
      'image': 'assets/images/course1.png',
      'category': '3D Design',
      'bookmark': false,
      'description': 'Learn the fundamentals of 3D design and illustration. Create stunning 3D artwork with professional techniques.',
      'instructor': 'Sarah Johnson',
      'duration': '6 hours',
      'lessons': '24 lessons',
      'level': 'Beginner',
    },
    {
      'title': '3D Blender and UI/UX',
      'price': '\$25',
      'oldPrice': '\$30',
      'rating': '4.5',
      'students': '9.837 students',
      'image': 'assets/images/course_blender.png',
      'category': '3D Design',
      'bookmark': false,
      'description': 'Master Blender for 3D modeling and combine it with UI/UX design principles.',
      'instructor': 'Mike Chen',
      'duration': '8 hours',
      'lessons': '30 lessons',
      'level': 'Intermediate',
    },
    {
      'title': '3D Icons Set Blender',
      'price': '\$22',
      'oldPrice': '',
      'rating': '4.6',
      'students': '10.837 students',
      'image': 'assets/images/course_icons.png',
      'category': '3D Design',
      'bookmark': false,
      'description': 'Create beautiful 3D icon sets using Blender. Perfect for app and web design.',
      'instructor': 'Emma Davis',
      'duration': '4 hours',
      'lessons': '18 lessons',
      'level': 'Beginner',
    },
    {
      'title': 'Digital Entrepreneur...',
      'price': '\$39',
      'oldPrice': '',
      'rating': '4.6',
      'students': '4.182 students',
      'image': 'assets/images/course2.png',
      'category': 'Business',
      'bookmark': true,
      'description': 'Learn how to start and grow a successful digital business from scratch.',
      'instructor': 'John Smith',
      'duration': '10 hours',
      'lessons': '35 lessons',
      'level': 'All Levels',
    },
    {
      'title': 'Digital Marketing: Fa...',
      'price': '\$28',
      'oldPrice': '\$41',
      'rating': '4.7',
      'students': '13.837 students',
      'image': 'assets/images/course_marketing.png',
      'category': 'Business',
      'bookmark': false,
      'description': 'Complete guide to digital marketing strategies for business growth.',
      'instructor': 'Lisa Wang',
      'duration': '12 hours',
      'lessons': '42 lessons',
      'level': 'Intermediate',
    },
    {
      'title': 'Entrepreneurship for...',
      'price': '\$22',
      'oldPrice': '\$50',
      'rating': '4.1',
      'students': '8.748 students',
      'image': 'assets/images/course_entrepreneur.png',
      'category': 'Business',
      'bookmark': false,
      'description': 'Essential entrepreneurship skills for starting your own business venture.',
      'instructor': 'Robert Brown',
      'duration': '7 hours',
      'lessons': '28 lessons',
      'level': 'Beginner',
    },
    {
      'title': 'CRM Management for D...',
      'price': '\$52',
      'oldPrice': '\$63',
      'rating': '4.8',
      'students': '11.039 students',
      'image': 'assets/images/course_crm.png',
      'category': 'Business',
      'bookmark': false,
      'description': 'Master Customer Relationship Management tools and strategies.',
      'instructor': 'Maria Garcia',
      'duration': '9 hours',
      'lessons': '32 lessons',
      'level': 'Advanced',
    },
    {
      'title': 'Learn UX User Persona',
      'price': '\$42',
      'oldPrice': '\$75',
      'rating': '4.7',
      'students': '7.098 students',
      'image': 'assets/images/course3.png',
      'category': 'Programming',
      'bookmark': false,
      'description': 'Create effective user personas for better UX design and product development.',
      'instructor': 'David Lee',
      'duration': '5 hours',
      'lessons': '20 lessons',
      'level': 'Beginner',
    },
    {
      'title': 'Flutter Mobile Apps',
      'price': '\$44',
      'oldPrice': '\$72',
      'rating': '4.8',
      'students': '7.928 students',
      'image': 'assets/images/course_flutter.png',
      'category': 'Programming',
      'bookmark': false,
      'description': 'Build beautiful cross-platform mobile applications with Flutter.',
      'instructor': 'Alex Taylor',
      'duration': '15 hours',
      'lessons': '50 lessons',
      'level': 'Intermediate',
    },
  ];

  List<Map<String, dynamic>> get filteredCourses {
    if (selectedCategory == 'All') {
      return allCourses;
    }
    return allCourses.where((course) => course['category'] == selectedCategory).toList();
  }

  // Function untuk navigasi ke CourseDetailPage
  void _navigateToCourseDetail(Map<String, dynamic> course) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailPage(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dapatkan ukuran layar
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Hitung childAspectRatio berdasarkan lebar layar
    double childAspectRatio;
    if (screenWidth < 360) {
      childAspectRatio = 0.68; // Layar kecil
    } else if (screenWidth < 400) {
      childAspectRatio = 0.70; // Layar sedang
    } else {
      childAspectRatio = 0.75; // Layar besar
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Most Popular Courses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
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
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFE53E3E) : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: const Color(0xFFE53E3E),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            if (isSelected) ...[
                              const Icon(
                                Icons.check_circle,
                                size: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 6),
                            ],
                            Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : const Color(0xFFE53E3E),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Courses Grid - RESPONSIF
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Hitung jumlah kolom berdasarkan lebar layar
                int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: childAspectRatio,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: filteredCourses.length,
                  itemBuilder: (context, index) {
                    final course = filteredCourses[index];
                    return GestureDetector(
                      onTap: () => _navigateToCourseDetail(course),
                      child: _buildCourseCard(course),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Hitung ukuran yang responsif
        final cardWidth = constraints.maxWidth;
        final imageHeight = cardWidth * 0.65; // 65% dari lebar card
        
        return Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              Stack(
                children: [
                  Container(
                    height: imageHeight,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        course['image'],
                        width: double.infinity,
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
                  // Bookmark Icon
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          course['bookmark'] = !course['bookmark'];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(
                          course['bookmark'] ? Icons.bookmark : Icons.bookmark_border,
                          size: 18,
                          color: const Color(0xFFE53E3E),
                        ),
                      ),
                    ),
                  ),
                  // Category Badge
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(course['category']),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        course['category'],
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Course Details - FLEKSIBEL
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Title
                      Flexible(
                        child: Text(
                          course['title'],
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      const SizedBox(height: 6),
                      
                      // Price
                      Row(
                        children: [
                          Text(
                            course['price'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE53E3E),
                            ),
                          ),
                          if (course['oldPrice'].isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                course['oldPrice'],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[500],
                                  decoration: TextDecoration.lineThrough,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ],
                      ),
                      
                      const SizedBox(height: 4),
                      
                      // Rating and Students
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            course['rating'],
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              '| ${course['students']}',
                              style: TextStyle(
                                fontSize: 9,
                                color: Colors.grey[600],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
        );
      },
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case '3D Design':
        return const Color(0xFF6366F1);
      case 'Business':
        return const Color(0xFFF59E0B);
      case 'Programming':
        return const Color(0xFF10B981);
      default:
        return const Color(0xFFE53E3E);
    }
  }
}