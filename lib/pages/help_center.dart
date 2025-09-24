import 'package:flutter/material.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedCategory = 'General';
  TextEditingController searchController = TextEditingController();
  
  // Add filtered FAQ items list
  List<Map<String, String>> filteredFaqItems = [];
  String searchQuery = '';

  final List<String> categories = ['General', 'Account', 'Course', 'Payment'];

  final List<Map<String, String>> faqItems = [
    {
      'question': 'What is Elera?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'How to use Elera?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Can I create my own course?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Is Elera free to use?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'How to make offer on Elera?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    // Add more FAQ items that contain "why" for better demo
    {
      'question': 'Why did my payment didn\'t working?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Why are the course prices different?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Why can\'t I play the course video?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Why didn\'t I get the course certificate?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
  ];

  final List<Map<String, dynamic>> contactOptions = [
    {
      'title': 'Customer Service',
      'icon': Icons.headset_mic_outlined,
      'color': Color(0xFF4F46E5),
      'backgroundColor': Color(0xFFEEF2FF),
      'useIcon': true,
    },
    {
      'title': 'WhatsApp',
      'color': Color(0xFF25D366),
      'backgroundColor': Color(0xFFE8F5E8),
      'useIcon': false,
      'customWidget': null,
    },
    {
      'title': 'Website',
      'icon': Icons.language_outlined,
      'color': Color(0xFF4F46E5),
      'backgroundColor': Color(0xFFEEF2FF),
      'useIcon': true,
    },
    {
      'title': 'Facebook',
      'color': Color(0xFF1877F2),
      'backgroundColor': Color(0xFFE3F2FD),
      'useIcon': false,
      'customWidget': null,
    },
    {
      'title': 'Twitter',
      'color': Color(0xFF000000),
      'backgroundColor': Color(0xFFF5F5F5),
      'useIcon': false,
      'customWidget': null,
    },
    {
      'title': 'Instagram',
      'color': Color(0xFFE4405F),
      'backgroundColor': Color(0xFFFCE4EC),
      'useIcon': false,
      'customWidget': null,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filteredFaqItems = faqItems; // Initialize with all FAQ items
    
    // Add listener to search controller
    searchController.addListener(() {
      _filterFAQItems(searchController.text);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  // Add filter function
  void _filterFAQItems(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredFaqItems = faqItems;
      } else {
        filteredFaqItems = faqItems.where((item) {
          return item['question']!.toLowerCase().contains(query.toLowerCase()) ||
                 item['answer']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  // Custom WhatsApp icon
  Widget _buildWhatsAppIcon() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xFF25D366),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Container(
          width: 14,
          height: 14,
          child: Stack(
            children: [
              // Chat bubble
              Positioned(
                left: 1,
                bottom: 1,
                child: Container(
                  width: 10,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Phone icon
              Positioned(
                right: 1,
                top: 1,
                child: Container(
                  width: 3,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Facebook icon
  Widget _buildFacebookIcon() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Color(0xFF1877F2),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          'f',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  // Custom Twitter/X icon
  Widget _buildTwitterIcon() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          'X',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Custom Instagram icon
  Widget _buildInstagramIcon() {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF58529),
            Color(0xFFDD2A7B),
            Color(0xFF8134AF),
            Color(0xFF515BD4),
          ],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Main square outline for camera
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            // Inner circle (lens)
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            // Flash dot
            Positioned(
              top: 2.5,
              right: 2.5,
              child: Container(
                width: 2,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Help Center',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.grey[600],
                  size: 18,
                ),
              ),
            ),
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
              indicatorColor: const Color(0xFF4F46E5),
              indicatorWeight: 3,
              labelColor: const Color(0xFF4F46E5),
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              tabs: const [
                Tab(text: 'FAQ'),
                Tab(text: 'Contact us'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // FAQ Tab
                _buildFAQTab(),
                // Contact us Tab
                _buildContactTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQTab() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Category Chips - Hide when searching
          if (searchQuery.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF4F46E5) : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFF4F46E5),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.white : const Color(0xFF4F46E5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

          // Search Bar
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Focus(
              child: Builder(
                builder: (context) {
                  final bool hasFocus = Focus.of(context).hasFocus;
                  return Container(
                    decoration: BoxDecoration(
                      color: hasFocus ? const Color(0xFFEEF2FF) : Colors.grey[100],
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
                          color: hasFocus ? const Color(0xFF4F46E5) : Colors.grey[500],
                        ),
                        suffixIcon: searchQuery.isNotEmpty 
                          ? IconButton(
                              icon: const Icon(Icons.tune, color: Color(0xFF4F46E5)),
                              onPressed: () {
                                searchController.clear();
                              },
                            )
                          : const Icon(
                              Icons.tune, 
                              color: Color(0xFF4F46E5),
                            ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),

          // FAQ Items - Show search results first, then all items
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Search Results Container (prioritized and in border)
                  if (searchQuery.isNotEmpty && filteredFaqItems.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: filteredFaqItems.map((item) {
                          final index = filteredFaqItems.indexOf(item);
                          return Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                child: _buildHighlightedText(
                                  item['question']!,
                                  true ? searchQuery : '',
                                ),
                              ),
                              if (index < filteredFaqItems.length - 1)
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Divider(
                                    color: Colors.grey[300],
                                    thickness: 1,
                                    height: 1,
                                  ),
                                ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  
                  // No results found
                  if (searchQuery.isNotEmpty && filteredFaqItems.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No results found',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try different keywords',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  // Regular FAQ Items (always show)
                  ...faqItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: _buildFAQItem(item, showHighlight: false, showBorder: true, showArrow: true),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(Map<String, String> item, {bool showHighlight = true, bool showBorder = true, bool showArrow = true}) {
    return Container(
      margin: showBorder ? const EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
      decoration: showBorder ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ) : null,
      child: Material(
        color: Colors.transparent,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            dividerColor: Colors.transparent,
            expansionTileTheme: const ExpansionTileThemeData(
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ExpansionTile(
              backgroundColor: Colors.transparent,
              collapsedBackgroundColor: Colors.transparent,
              title: _buildHighlightedText(
                item['question']!,
                showHighlight ? searchQuery : '',
              ),
              children: [
                Column(
                  children: [
                    Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _buildHighlightedText(
                          item['answer']!,
                          showHighlight ? searchQuery : '',
                          isAnswer: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              trailing: showArrow ? const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF4F46E5),
              ) : const SizedBox.shrink(),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }

  // Add highlight text function
  Widget _buildHighlightedText(String text, String query, {bool isAnswer = false}) {
    if (query.isEmpty) {
      return Text(
        text,
        style: TextStyle(
          fontSize: isAnswer ? 14 : 16,
          fontWeight: isAnswer ? FontWeight.normal : FontWeight.bold,
          color: isAnswer ? Colors.grey[600] : Colors.black,
          height: isAnswer ? 1.5 : null,
        ),
      );
    }

    final List<TextSpan> spans = [];
    final String lowerText = text.toLowerCase();
    final String lowerQuery = query.toLowerCase();
    
    int start = 0;
    int index = lowerText.indexOf(lowerQuery);
    
    while (index >= 0) {
      // Add text before the match
      if (index > start) {
        spans.add(TextSpan(
          text: text.substring(start, index),
          style: TextStyle(
            fontSize: isAnswer ? 14 : 16,
            fontWeight: isAnswer ? FontWeight.normal : FontWeight.bold,
            color: isAnswer ? Colors.grey[600] : Colors.black,
          ),
        ));
      }
      
      // Add highlighted match
      spans.add(TextSpan(
        text: text.substring(index, index + query.length),
        style: TextStyle(
          fontSize: isAnswer ? 14 : 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ));
      
      start = index + query.length;
      index = lowerText.indexOf(lowerQuery, start);
    }
    
    // Add remaining text
    if (start < text.length) {
      spans.add(TextSpan(
        text: text.substring(start),
        style: TextStyle(
          fontSize: isAnswer ? 14 : 16,
          fontWeight: isAnswer ? FontWeight.normal : FontWeight.bold,
          color: isAnswer ? Colors.grey[600] : Colors.black,
        ),
      ));
    }
    
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  Widget _buildContactTab() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contactOptions.length,
        itemBuilder: (context, index) {
          final option = contactOptions[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () {
                print('Tapped on ${option['title']}');
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: option['backgroundColor'],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _getContactIcon(option['title']),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        option['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getContactIcon(String title) {
    switch (title) {
      case 'WhatsApp':
        return _buildWhatsAppIcon();
      case 'Facebook':
        return _buildFacebookIcon();
      case 'Twitter':
        return _buildTwitterIcon();
      case 'Instagram':
        return _buildInstagramIcon();
      case 'Customer Service':
        return Icon(
          Icons.headset_mic_outlined,
          color: Color(0xFF4F46E5),
          size: 20,
        );
      case 'Website':
        return Icon(
          Icons.language_outlined,
          color: Color(0xFF4F46E5),
          size: 20,
        );
      default:
        return Icon(
          Icons.help_outline,
          color: Colors.grey,
          size: 20,
        );
    }
  }
}