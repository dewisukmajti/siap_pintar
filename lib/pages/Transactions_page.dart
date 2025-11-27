import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transactions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TransactionsPage(),
    );
  }
}

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TransactionItem> transactions = [
      TransactionItem(
        title: 'Mastering Figma A to Z',
        icon: '🎨',
        status: 'Paid',
        course: 'UI/UX Design',
        price: '\$40.00',
        transactionId: 'SK7263727399',
      ),
      TransactionItem(
        title: 'Mastering Blender 3D',
        icon: '🎭',
        status: 'Paid',
        course: '3D Modeling',
        price: '\$50.00',
        transactionId: 'SK7263727400',
      ),
      TransactionItem(
        title: 'Build Personal Branding',
        icon: '👥',
        status: 'Paid',
        course: 'Branding',
        price: '\$35.00',
        transactionId: 'SK7263727401',
      ),
      TransactionItem(
        title: 'Complete UI Designer',
        icon: '📱',
        status: 'Paid',
        course: 'UI Design',
        price: '\$45.00',
        transactionId: 'SK7263727402',
      ),
      TransactionItem(
        title: 'Full-Stack Web Developer',
        icon: '💻',
        status: 'Paid',
        course: 'Web Development',
        price: '\$60.00',
        transactionId: 'SK7263727403',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // NAVBAR ATAS PUTIH
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE53E3E), // GANTI JADI WARNA E53E3E
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.check_circle, color: Colors.white),
          ),
        ),
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(item: transactions[index]);
        },
      ),
    );
  }
}

class TransactionItem {
  final String title;
  final String icon;
  final String status;
  final String course;
  final String price;
  final String transactionId;

  TransactionItem({
    required this.title,
    required this.icon,
    required this.status,
    required this.course,
    required this.price,
    required this.transactionId,
  });
}

class TransactionCard extends StatelessWidget {
  final TransactionItem item;

  const TransactionCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
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
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                item.icon,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE2E2), // WARNA BACKGROUND E53E3E YANG LEMBUT
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    item.status,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFE53E3E), // WARNA E53E3E
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EReceiptPage(item: item),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE53E3E), // GANTI JADI WARNA E53E3E
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'E-Receipt',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EReceiptPage extends StatelessWidget {
  final TransactionItem item;

  const EReceiptPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white, // NAVBAR ATAS PUTIH
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'E-Receipt',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Share E-Receipt'),
              ),
              const PopupMenuItem(
                child: Text('Download E-Receipt'),
              ),
              const PopupMenuItem(
                child: Text('Print'),
              ),
            ],
            icon: const Icon(Icons.more_vert, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Barcode Section
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  const CustomBarcode(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '273628',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '837279',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Course & Category Section
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                children: [
                  _buildInfoRow('Course', item.title),
                  const SizedBox(height: 12),
                  _buildInfoRow('Category', item.course),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Name sampai Country Section
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                children: [
                  _buildInfoRow('Name', 'Andrew Ainsley'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Phone', '+1 111 467 378 399'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Email', 'andrew_ainsley@domain.com'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Country', 'United States'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Price sampai Status Section
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Column(
                children: [
                  _buildInfoRow('Price', item.price),
                  const SizedBox(height: 12),
                  _buildInfoRow('Payment Methods', 'Credit Card'),
                  const SizedBox(height: 12),
                  _buildInfoRow('Date', 'Dec 14, 2024 | 14:27:45 PM'),
                  const SizedBox(height: 12),
                  _buildInfoRowWithCopy('Transaction ID', item.transactionId),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2), // WARNA BACKGROUND E53E3E YANG LEMBUT
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Paid',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFE53E3E), // WARNA E53E3E
                            fontWeight: FontWeight.w600,
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
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRowWithCopy(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.content_copy,
              size: 16,
              color: const Color(0xFFE53E3E), // GANTI JADI WARNA E53E3E
            ),
          ],
        ),
      ],
    );
  }
}

class CustomBarcode extends StatelessWidget {
  const CustomBarcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Barcode pattern
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              80,
              (index) => Expanded(
                child: Container(
                  color: index % 3 == 0 ? Colors.black : Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}