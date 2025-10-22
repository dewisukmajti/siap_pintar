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
      'question': 'What is siap pintar?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'How to use siap pintar?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Can I create my own course?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'Is siap pintar free to use?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua'
    },
    {
      'question': 'How to make offer on siap pintar?',
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
      'color': Color(0xFFE53E3E),
      'useIcon': true,
    },
    {
      'title': 'WhatsApp',
      'imagePath': 'assets/images/whatsApp.png',
      'useIcon': false,
    },
    {
      'title': 'Website',
      'icon': Icons.language_outlined,
      'color': Color(0xFFE53E3E),
      'useIcon': true,
    },
    {
      'title': 'Facebook',
      'imagePath': 'assets/images/facebook.png',
      'useIcon': false,
    },
    {
      'title': 'Twitter',
      'imagePath': 'assets/images/twitter x .png',
      'useIcon': false,
    },
    {
      'title': 'Instagram',
      'imagePath': 'assets/images/instagram.png',
      'useIcon': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filteredFaqItems = faqItems;
    
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

  // Filter function - hanya match dari awal (prefix)
  void _filterFAQItems(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredFaqItems = faqItems;
      } else {
        filteredFaqItems = faqItems.where((item) {
          return item['question']!.toLowerCase().startsWith(query.toLowerCase()) ||
                 item['answer']!.toLowerCase().startsWith(query.toLowerCase());
        }).toList();
      }
    });
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
                Tab(text: 'FAQ'),
                Tab(text: 'Contact us'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildFAQTab(),
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
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
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
                              icon: const Icon(Icons.tune, color: Color(0xFFE53E3E)),
                              onPressed: () {
                                searchController.clear();
                              },
                            )
                          : const Icon(
                              Icons.tune, 
                              color: Color(0xFFE53E3E),
                            ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Color(0xFFE53E3E), width: 1),
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

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                  
                  if (searchQuery.isEmpty)
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
                color: Color(0xFFE53E3E),
              ) : const SizedBox.shrink(),
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
      ),
    );
  }

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
                      child: Center(
                        child: _getContactIcon(option['title'], option),
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

  Widget _getContactIcon(String title, Map<String, dynamic> option) {
    if (option['useIcon'] == true) {
      return Icon(
        option['icon'],
        color: option['color'],
        size: 20,
      );
    } else {
      return Image.asset(
        option['imagePath'],
        width: 20,
        height: 20,
        errorBuilder: (context, error, stackTrace) {
          return _getFallbackIcon(title);
        },
      );
    }
  }

  Widget _getFallbackIcon(String title) {
    switch (title) {
      case 'WhatsApp':
        return Icon(Icons.chat, color: Color(0xFF25D366), size: 20);
      case 'Facebook':
        return Icon(Icons.facebook, color: Color(0xFF1877F2), size: 20);
      case 'Twitter':
        return Text('X', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold));
      case 'Instagram':
        return Icon(Icons.camera_alt, color: Color(0xFFE4405F), size: 20);
      default:
        return Icon(Icons.help_outline, color: Colors.grey, size: 20);
    }
  }
}