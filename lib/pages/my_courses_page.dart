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
      'icon': Icons.design_services,
      'color': const Color(0xFFE53E3E),
    },
    {
      'title': 'Wordpress Website Dev...',
      'duration': '3 hrs 15 mins',
      'progress': 0.50,
      'icon': Icons.web,
      'color': const Color(0xFFF59E0B),
    },
    {
      'title': '3D Blender and UI/UX',
      'duration': '2 hrs 48 mins',
      'progress': 0.25,
      'icon': Icons.view_in_ar,
      'color': const Color(0xFF8B5CF6),
    },
    {
      'title': 'Learn UX User Persona',
      'duration': '2 hrs 35 mins',
      'progress': 0.60,
      'icon': Icons.person_outline,
      'color': const Color(0xFFF59E0B),
    },
  ];

  final List<Map<String, dynamic>> completedCourses = [
    {
      'title': '3D Design Illustration',
      'duration': '2 hrs 25 mins',
      'progress': 1.0,
      'icon': Icons.threed_rotation,
      'color': const Color(0xFFEC4899),
    },
    {
      'title': 'CRM Management for D...',
      'duration': '3 hrs 20 mins',
      'progress': 1.0,
      'icon': Icons.business,
      'color': const Color(0xFF10B981),
    },
    {
      'title': 'Flutter Mobile Apps',
      'duration': '4 hrs 50 mins',
      'progress': 1.0,
      'icon': Icons.phone_android,
      'color': const Color(0xFF3B82F6),
    },
    {
      'title': '3D Icons Set Blender',
      'duration': '2 hrs 45 mins',
      'progress': 1.0,
      'icon': Icons.collections,
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
          icon: course['icon'],
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
    required IconData icon,
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
              // Course Icon - Ukuran lebih besar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 40,
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
              // Circular Progress - Ukuran lebih besar
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

// Course Detail Page
class CourseDetailPage extends StatelessWidget {
  final String title;
  final bool isCompleted;

  const CourseDetailPage({
    Key? key,
    required this.title,
    required this.isCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> lessons = [
      {
        'title': 'Why Using Figma',
        'duration': '10 mins',
        'isLocked': false,
        'description': 'Learn the basics of Figma and why it\'s the best tool for UI/UX design. This lesson covers the fundamental concepts and benefits of using Figma for your design projects.',
      },
      {
        'title': 'Set up Your Figma Account',
        'duration': '5 mins',
        'isLocked': false,
        'description': 'Step-by-step guide to create and configure your Figma account. You\'ll learn how to set up your profile, preferences, and workspace settings.',
      },
      {
        'title': 'Take a Look Figma Interface',
        'duration': '15 mins',
        'isLocked': false,
        'description': 'Explore the Figma interface and learn about all the tools and panels. This comprehensive overview will help you navigate Figma efficiently.',
      },
      {
        'title': 'Working with Frame & Layer',
        'duration': '10 mins',
        'isLocked': !isCompleted,
        'description': 'Master the concepts of frames and layers in Figma. Learn how to organize your designs effectively using these essential features.',
      },
      {
        'title': 'Working with Text & Grids',
        'duration': '10 mins',
        'isLocked': !isCompleted,
        'description': 'Learn how to work with text styles and layout grids in Figma. This lesson covers typography best practices and grid systems.',
      },
      {
        'title': 'Using Figma Plugins',
        'duration': '15 mins',
        'isLocked': !isCompleted,
        'description': 'Discover powerful Figma plugins that can enhance your workflow. Learn how to install, configure, and use plugins effectively.',
      },
    ];

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
          // Lessons List - Tanpa Tab Bar
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Section Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Section 1 - Introduction',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '15 mins',
                      style: TextStyle(
                        fontSize: 14,
                        color: const Color(0xFFE53E3E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Lessons
                ...lessons.asMap().entries.map((entry) {
                  final index = entry.key;
                  final lesson = entry.value;
                  return _buildLessonItem(
                    context: context,
                    number: '0${index + 1}',
                    title: lesson['title'] as String,
                    duration: lesson['duration'] as String,
                    description: lesson['description'] as String,
                    isLocked: lesson['isLocked'] as bool,
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