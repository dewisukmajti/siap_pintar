import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({Key? key}) : super(key: key);

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> ongoingCourses = [
    {
      'title': 'Intro to UI/UX Design',
      'duration': '2 hrs 30 mins',
      'progress': 0.75,
      'image': 'assets/images/course1.png',
      'color': const Color(0xFFE53E3E),
    },
    {
      'title': 'Wordpress Website Dev...',
      'duration': '3 hrs 15 mins',
      'progress': 0.50,
      'image': 'assets/images/course2.png',
      'color': const Color(0xFFF59E0B),
    },
    {
      'title': '3D Blender and UI/UX',
      'duration': '2 hrs 48 mins',
      'progress': 0.25,
      'image': 'assets/images/course3.png',
      'color': const Color(0xFF8B5CF6),
    },
    {
      'title': 'Learn UX User Persona',
      'duration': '2 hrs 35 mins',
      'progress': 0.60,
      'image': 'assets/images/course1.png',
      'color': const Color(0xFFF59E0B),
    },
  ];

  final List<Map<String, dynamic>> completedCourses = [
    {
      'title': '3D Design Illustration',
      'duration': '2 hrs 25 mins',
      'progress': 1.0,
      'image': 'assets/images/course1.png',
      'color': const Color(0xFFEC4899),
    },
    {
      'title': 'CRM Management for D...',
      'duration': '3 hrs 20 mins',
      'progress': 1.0,
      'image': 'assets/images/course_crm.png',
      'color': const Color(0xFF10B981),
    },
    {
      'title': 'Flutter Mobile Apps',
      'duration': '4 hrs 50 mins',
      'progress': 1.0,
      'image': 'assets/images/course_flutter.png',
      'color': const Color(0xFF3B82F6),
    },
    {
      'title': '3D Icons Set Blender',
      'duration': '2 hrs 45 mins',
      'progress': 1.0,
      'image': 'assets/images/course_blender.png',
      'color': const Color(0xFF4F46E5),
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'My Courses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFFE53E3E),
              indicatorWeight: 3,
              labelColor: const Color(0xFFE53E3E),
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'Ongoing'),
                Tab(text: 'Completed'),
              ],
            ),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Ongoing Tab
                _buildCourseList(ongoingCourses, false),
                // Completed Tab
                _buildCourseList(completedCourses, true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList(List<Map<String, dynamic>> courses, bool isCompleted) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return _buildCourseCard(
          title: course['title'],
          duration: course['duration'],
          progress: course['progress'],
          imagePath: course['image'],
          color: course['color'],
          isCompleted: isCompleted,
        );
      },
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String duration,
    required double progress,
    required String imagePath,
    required Color color,
    required bool isCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          // Navigate to course detail
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(
                title: title,
                isCompleted: isCompleted,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Course Image - Ganti dari icon ke gambar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.image,
                          color: Colors.grey[400],
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Course Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Circular Progress
              SizedBox(
                width: 70,
                height: 70,
                child: CustomPaint(
                  painter: CircularProgressPainter(
                    progress: progress,
                    color: isCompleted ? const Color(0xFFE53E3E) : color,
                  ),
                  child: Center(
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isCompleted ? const Color(0xFFE53E3E) : color,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter untuk Circular Progress
class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircularProgressPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle
    final backgroundPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    canvas.drawCircle(center, radius - 3, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - 3),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Course Detail Page dengan Multiple Sections
class CourseDetailPage extends StatelessWidget {
  final String title;
  final bool isCompleted;

  const CourseDetailPage({
    Key? key,
    required this.title,
    required this.isCompleted,
  }) : super(key: key);

  // Function to get course content based on title
  Map<String, dynamic> _getCourseContent(String courseTitle) {
    if (courseTitle.contains('Wordpress')) {
      return {
        'sections': [
          {
            'title': 'Section 1 - Introduction',
            'duration': '30 mins',
            'lessons': [
              {
                'number': '01',
                'title': 'Why Using WordPress',
                'duration': '10 mins',
                'description': 'Learn why WordPress is the most popular CMS in the world. Understand its benefits for website development and content management.',
              },
              {
                'number': '02',
                'title': 'Set up Your WordPress Account',
                'duration': '5 mins',
                'description': 'Step-by-step guide to create and configure your WordPress account. Learn about hosting, domains, and basic setup.',
              },
              {
                'number': '03',
                'title': 'Take a Look WordPress Dashboard',
                'duration': '15 mins',
                'description': 'Explore the WordPress dashboard and learn about all the tools and features. Master the admin interface for efficient website management.',
              },
            ],
          },
          {
            'title': 'Section 2 - Advanced Topics',
            'duration': '55 mins',
            'lessons': [
              {
                'number': '04',
                'title': 'Working with Themes & Plugins',
                'duration': '15 mins',
                'description': 'Learn how to install and customize WordPress themes. Discover essential plugins to extend your website functionality.',
              },
              {
                'number': '05',
                'title': 'Creating Pages & Posts',
                'duration': '20 mins',
                'description': 'Master the difference between pages and posts. Learn how to create, edit, and manage your website content effectively.',
              },
              {
                'number': '06',
                'title': 'Customizing with Widgets',
                'duration': '10 mins',
                'description': 'Understand how to use widgets to customize your website sidebar, footer, and other widget-ready areas.',
              },
              {
                'number': '07',
                'title': 'SEO Optimization',
                'duration': '10 mins',
                'description': 'Learn essential SEO techniques to make your WordPress website search engine friendly and improve your rankings.',
              },
            ],
          },
        ],
      };
    } else if (courseTitle.contains('UI/UX Design')) {
      return {
        'sections': [
          {
            'title': 'Section 1 - Design Fundamentals',
            'duration': '45 mins',
            'lessons': [
              {
                'number': '01',
                'title': 'What is UI/UX Design?',
                'duration': '15 mins',
                'description': 'Understand the difference between UI and UX design. Learn the core principles and importance of good design.',
              },
              {
                'number': '02',
                'title': 'Design Thinking Process',
                'duration': '20 mins',
                'description': 'Explore the design thinking methodology and how to apply it to create user-centered designs.',
              },
              {
                'number': '03',
                'title': 'User Research Methods',
                'duration': '10 mins',
                'description': 'Learn various user research techniques to gather insights and understand user needs.',
              },
            ],
          },
          {
            'title': 'Section 2 - Practical Skills',
            'duration': '1 hr 45 mins',
            'lessons': [
              {
                'number': '04',
                'title': 'Wireframing Basics',
                'duration': '25 mins',
                'description': 'Learn how to create effective wireframes to plan your design layout and structure.',
              },
              {
                'number': '05',
                'title': 'Prototyping Techniques',
                'duration': '30 mins',
                'description': 'Master prototyping methods to create interactive designs and test user flows.',
              },
              {
                'number': '06',
                'title': 'Color Theory & Typography',
                'duration': '25 mins',
                'description': 'Understand color psychology and typography principles to create visually appealing designs.',
              },
              {
                'number': '07',
                'title': 'Design Systems',
                'duration': '25 mins',
                'description': 'Learn how to create and maintain design systems for consistent and scalable designs.',
              },
            ],
          },
        ],
      };
    } else if (courseTitle.contains('3D Blender')) {
      return {
        'sections': [
          {
            'title': 'Section 1 - Blender Basics',
            'duration': '40 mins',
            'lessons': [
              {
                'number': '01',
                'title': 'Blender Interface Overview',
                'duration': '15 mins',
                'description': 'Get familiar with Blender\'s interface, workspace, and essential tools for 3D modeling.',
              },
              {
                'number': '02',
                'title': 'Basic Navigation & Controls',
                'duration': '10 mins',
                'description': 'Learn how to navigate the 3D viewport and use basic controls for efficient modeling.',
              },
              {
                'number': '03',
                'title': 'Creating Your First Object',
                'duration': '15 mins',
                'description': 'Create and manipulate basic 3D objects using Blender\'s modeling tools.',
              },
            ],
          },
          {
            'title': 'Section 2 - 3D Modeling',
            'duration': '2 hrs 8 mins',
            'lessons': [
              {
                'number': '04',
                'title': 'Mesh Editing Techniques',
                'duration': '25 mins',
                'description': 'Learn advanced mesh editing tools and techniques for complex 3D models.',
              },
              {
                'number': '05',
                'title': 'Materials and Texturing',
                'duration': '30 mins',
                'description': 'Understand how to apply materials and textures to make your 3D models look realistic.',
              },
              {
                'number': '06',
                'title': 'Lighting and Rendering',
                'duration': '25 mins',
                'description': 'Master lighting techniques and rendering settings for professional-looking 3D scenes.',
              },
              {
                'number': '07',
                'title': 'Animation Basics',
                'duration': '48 mins',
                'description': 'Learn the fundamentals of 3D animation and how to create simple animations in Blender.',
              },
            ],
          },
        ],
      };
    } else if (courseTitle.contains('Flutter')) {
      return {
        'sections': [
          {
            'title': 'Section 1 - Flutter Fundamentals',
            'duration': '50 mins',
            'lessons': [
              {
                'number': '01',
                'title': 'What is Flutter?',
                'duration': '10 mins',
                'description': 'Introduction to Flutter framework and its advantages for cross-platform mobile development.',
              },
              {
                'number': '02',
                'title': 'Setting Up Development Environment',
                'duration': '15 mins',
                'description': 'Step-by-step guide to install and configure Flutter SDK and Android Studio.',
              },
              {
                'number': '03',
                'title': 'Understanding Widgets',
                'duration': '25 mins',
                'description': 'Learn about Flutter widgets and how they work to build user interfaces.',
              },
            ],
          },
          {
            'title': 'Section 2 - App Development',
            'duration': '4 hrs',
            'lessons': [
              {
                'number': '04',
                'title': 'Building Your First App',
                'duration': '45 mins',
                'description': 'Create your first Flutter app and understand the basic project structure.',
              },
              {
                'number': '05',
                'title': 'State Management',
                'duration': '1 hr',
                'description': 'Learn different state management approaches in Flutter for dynamic apps.',
              },
              {
                'number': '06',
                'title': 'API Integration',
                'duration': '1 hr 15 mins',
                'description': 'Connect your Flutter app to backend services and handle API calls.',
              },
              {
                'number': '07',
                'title': 'Publishing to App Stores',
                'duration': '1 hr',
                'description': 'Learn how to prepare and publish your Flutter app to Google Play and App Store.',
              },
            ],
          },
        ],
      };
    } else {
      // Default content for other courses
      return {
        'sections': [
          {
            'title': 'Section 1 - Introduction',
            'duration': '30 mins',
            'lessons': [
              {
                'number': '01',
                'title': 'Course Overview',
                'duration': '10 mins',
                'description': 'Get an overview of what you will learn in this course and the skills you will develop.',
              },
              {
                'number': '02',
                'title': 'Setting Up Environment',
                'duration': '10 mins',
                'description': 'Prepare your development environment with all necessary tools and software.',
              },
              {
                'number': '03',
                'title': 'Basic Concepts',
                'duration': '10 mins',
                'description': 'Learn the fundamental concepts and principles that form the foundation of this course.',
              },
            ],
          },
          {
            'title': 'Section 2 - Core Topics',
            'duration': '2 hrs 15 mins',
            'lessons': [
              {
                'number': '04',
                'title': 'Advanced Techniques',
                'duration': '35 mins',
                'description': 'Dive deeper into advanced techniques and methodologies relevant to the course topic.',
              },
              {
                'number': '05',
                'title': 'Practical Applications',
                'duration': '40 mins',
                'description': 'Apply what you\'ve learned to real-world scenarios and practical projects.',
              },
              {
                'number': '06',
                'title': 'Best Practices',
                'duration': '30 mins',
                'description': 'Learn industry best practices and professional standards for the subject matter.',
              },
              {
                'number': '07',
                'title': 'Project Development',
                'duration': '30 mins',
                'description': 'Work on a comprehensive project that incorporates all the skills learned in the course.',
              },
            ],
          },
        ],
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseContent = _getCourseContent(title);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(
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
      body: Column(
        children: [
          // Lessons List dengan Multiple Sections
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Build sections dynamically based on course content
                ...courseContent['sections'].map<Widget>((section) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            section['title'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            section['duration'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFFE53E3E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Section Lessons
                      ...section['lessons'].map<Widget>((lesson) {
                        return _buildLessonItem(
                          context: context,
                          number: lesson['number'],
                          title: lesson['title'],
                          duration: lesson['duration'],
                          description: lesson['description'],
                          isLocked: !isCompleted && int.parse(lesson['number']) > 3,
                        );
                      }).toList(),

                      const SizedBox(height: 24),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),

          // Bottom Button
          Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE53E3E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: Text(
                  isCompleted ? 'Start Course Again' : 'Continue Course',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem({
    required BuildContext context,
    required String number,
    required String title,
    required String duration,
    required String description,
    required bool isLocked,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Lesson Number
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE53E3E),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Lesson Info
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
                  duration,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          // Play/Lock Icon - Clickable for description
          GestureDetector(
            onTap: () {
              if (!isLocked) {
                _showLessonDescription(context, title, duration, description);
              }
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isLocked ? Colors.grey[200] : const Color(0xFFE53E3E),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isLocked ? Icons.lock : Icons.play_arrow,
                color: isLocked ? Colors.grey[400] : Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showLessonDescription(
    BuildContext context,
    String title,
    String duration,
    String description,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 20),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE53E3E).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.play_circle_filled,
                        color: Color(0xFFE53E3E),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            duration,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Description content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lesson Description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // What you'll learn section
                      const Text(
                        'What You\'ll Learn',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildBulletPoint('Understand core concepts and principles'),
                      _buildBulletPoint('Practice with hands-on exercises'),
                      _buildBulletPoint('Apply learned skills to real projects'),
                      _buildBulletPoint('Get tips and best practices'),
                    ],
                  ),
                ),
              ),
              
              // Start Lesson Button
              Container(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53E3E),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Starting lesson...'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: const Text(
                      'Start Lesson',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFFE53E3E),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}