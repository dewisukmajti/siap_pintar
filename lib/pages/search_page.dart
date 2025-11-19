import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  bool isSearching = false;
  String selectedTab = 'Courses'; // 'Courses' or 'Mentors'

  // Recent searches
  final List<String> recentSearches = [
    'CRM Management!',
    'Full-Stack Web Developer',
    'Learn UX User Persona',
    '3D Blender and UI/UX',
    'Digital Entrepreneurship',
    '3D Icons Set Blender',
    'Flutter Mobile App',
    '3D Design Illustration',
  ];

  // Sample courses data
  final List<Map<String, String>> courseResults = [
    {
      'title': '3D Modeling & Textur...',
      'price': '\$25',
      'rating': '4.8',
      'students': '8,867 students',
      'image': 'assets/images/course1.png',
      'category': '3D Design',
      'bookmark': 'true',
    },
    {
      'title': '3D Characters Illustra...',
      'price': '\$52',
      'rating': '4.8',
      'students': '0.776 students',
      'image': 'assets/images/course2.png',
      'category': '3D Design',
      'bookmark': 'false',
    },
    {
      'title': 'Mastering 3D Modeli...',
      'price': '\$28',
      'rating': '4.8',
      'students': '5.124 students',
      'image': 'assets/images/course3.png',
      'category': '3D Design',
      'bookmark': 'false',
    },
    {
      'title': '3D Design Illustration',
      'price': '\$42',
      'rating': '4.7',
      'students': '1,691 students',
      'image': 'assets/images/course1.png',
      'category': '3D Design',
      'bookmark': 'false',
    },
  ];

  // Sample mentors data
  final List<Map<String, String>> mentorResults = [
    {
      'name': 'Lauralie Williams',
      'title': 'Product UX President',
      'image': 'assets/images/mentor1.png',
    },
    {
      'name': 'Benny Williams',
      'title': 'Director of Marketing',
      'image': 'assets/images/mentor2.png',
    },
    {
      'name': 'Clinton Williams',
      'title': 'Senior Manager',
      'image': 'assets/images/mentor3.png',
    },
    {
      'name': 'Sanjuanita Williams',
      'title': 'Manager Solution Engineering',
      'image': 'assets/images/mentor4.png',
    },
    {
      'name': 'Charloette Williams',
      'title': 'Head of Marketing',
      'image': 'assets/images/mentor5.png',
    },
    {
      'name': 'Daryl Williams',
      'title': 'Director of Product',
      'image': 'assets/images/mentor1.png',
    },
    {
      'name': 'Jamel Williams',
      'title': 'Senior UX Designer',
      'image': 'assets/images/mentor2.png',
    },
    {
      'name': 'Marci Williams',
      'title': 'Sales Director',
      'image': 'assets/images/mentor3.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text;
        // Hanya set isSearching ke true jika input minimal 2 karakter (simulasi "not found" page)
        if (searchQuery.length == 1) {
          isSearching = false; // Tampilkan halaman "not found"
        } else if (searchQuery.length >= 2) {
          isSearching = true; // Tampilkan halaman results
        } else {
          isSearching = false; // Tampilkan recent searches
        }
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    searchController.clear();
    setState(() {
      searchQuery = '';
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Focus(
                child: Builder(
                  builder: (context) {
                    final bool hasFocus = Focus.of(context).hasFocus;
                    return Container(
                      decoration: BoxDecoration(
                        color: hasFocus ? const Color(0xFFFFF5F5) : Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: searchController,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(
                            Icons.search,
                            color: hasFocus ? const Color(0xFFE53E3E) : Colors.grey[500],
                          ),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear, color: Color(0xFFE53E3E)),
                                  onPressed: _clearSearch,
                                )
                              : Icon(
                                  Icons.tune,
                                  color: Colors.grey[500],
                                ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFFE53E3E),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
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
                    );
                  },
                ),
              ),
            ),
            
            if (!isSearching)
              // Recent Searches atau Not Found Page
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: searchQuery.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Recent',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        recentSearches.clear();
                                      });
                                    },
                                    child: const Text(
                                      'Clear All',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFE53E3E),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              ...recentSearches.map((search) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.history,
                                        size: 18,
                                        color: Colors.grey[500],
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          search,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            recentSearches.remove(search);
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 60),
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.sentiment_dissatisfied_outlined,
                                    size: 80,
                                    color: Colors.grey[400],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Not Found',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Sorry, the keyword you found cannot be\nfound, please check again or search with\nanother keyword',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              )
            else
              // Search Results
              Expanded(
                child: Column(
                  children: [
                    // Courses and Mentors Tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTab = 'Courses';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: selectedTab == 'Courses'
                                          ? const Color(0xFFE53E3E)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Courses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: selectedTab == 'Courses'
                                        ? const Color(0xFFE53E3E)
                                        : Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedTab = 'Mentors';
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: selectedTab == 'Mentors'
                                          ? const Color(0xFFE53E3E)
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Mentors',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: selectedTab == 'Mentors'
                                        ? const Color(0xFFE53E3E)
                                        : Colors.grey[500],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    
                    // Results Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            'Results for "$searchQuery"',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            selectedTab == 'Courses'
                                ? '${courseResults.length} found'
                                : '${mentorResults.length} founds',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Results List
                    Expanded(
                      child: selectedTab == 'Courses'
                          ? _buildCourseResultsList()
                          : _buildMentorResultsList(),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseResultsList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: courseResults.map((course) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                  // Course Image
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      child: Image.asset(
                        course['image']!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.image,
                              color: Colors.grey[400],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Course Details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Text(
                              course['category']!,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFE53E3E),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            course['title']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                course['price']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFE53E3E),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.star,
                                size: 12,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                course['rating']!,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                course['students']!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Bookmark Icon
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      course['bookmark'] == 'true'
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: const Color(0xFFE53E3E),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMentorResultsList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: mentorResults.map((mentor) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Mentor Image
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
                        mentor['image']!,
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
                  // Mentor Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mentor['name']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          mentor['title']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Follow Button
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[400]!,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}