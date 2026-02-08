import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<NewsItem> _newsItems = [
    NewsItem(
      title: 'নিরাপত্তা টিপস: রাতে চলাচলের সময় সতর্কতা',
      description: 'রাতে একা চলাচল করার সময় যে বিষয়গুলো মাথায় রাখা উচিত...',
      timestamp: '২ ঘন্টা আগে',
      category: 'নিরাপত্তা',
    ),
    NewsItem(
      title: 'নতুন জরুরি হটলাইন চালু',
      description: 'সরকার নতুন জরুরি হটলাইন ১৬১২৩ চালু করেছে যেখানে...',
      timestamp: '৫ ঘন্টা আগে',
      category: 'সংবাদ',
    ),
    NewsItem(
      title: 'সাইবার নিরাপত্তা: অনলাইনে নিরাপদ থাকার উপায়',
      description: 'সোশ্যাল মিডিয়া ব্যবহার করার সময় কিভাবে নিজেকে সুরক্ষিত রাখবেন...',
      timestamp: '১ দিন আগে',
      category: 'নিরাপত্তা',
    ),
    NewsItem(
      title: 'কমিউনিটি সুরক্ষা প্রোগ্রাম শুরু',
      description: 'স্থানীয় এলাকায় কমিউনিটি সুরক্ষা প্রোগ্রাম শুরু হয়েছে...',
      timestamp: '২ দিন আগে',
      category: 'ইভেন্ট',
    ),
  ];

  bool _isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('ফিড'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshFeed,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _newsItems.length,
          itemBuilder: (context, index) {
            return _buildNewsCard(_newsItems[index]);
          },
        ),
      ),
    );
  }

  Widget _buildNewsCard(NewsItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          _showNewsDetail(item);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getCategoryColor(item.category).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.category,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: _getCategoryColor(item.category),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Image placeholder
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // Timestamp and read more
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 16,
                        color: Color(0xFF757575),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item.timestamp,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'আরো পড়ুন →',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFD32F2F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'নিরাপত্তা':
        return const Color(0xFFD32F2F);
      case 'সংবাদ':
        return const Color(0xFF388E3C);
      case 'ইভেন্ট':
        return const Color(0xFFFFA726);
      default:
        return const Color(0xFF757575);
    }
  }

  Future<void> _refreshFeed() async {
    setState(() {
      _isRefreshing = true;
    });
    // Simulate network request
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isRefreshing = false;
    });
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ফিড আপডেট হয়েছে')),
      );
    }
  }

  void _showNewsDetail(NewsItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Category badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getCategoryColor(item.category).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.category,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: _getCategoryColor(item.category),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 8),
              // Timestamp
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 16,
                    color: Color(0xFF757575),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    item.timestamp,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF757575),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '${item.description}\n\nএটি একটি নমুনা সংবাদ নিবন্ধ। প্রকৃত বাস্তবায়নে এখানে সম্পূর্ণ নিবন্ধের বিস্তারিত বিবরণ থাকবে।',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF212121),
                      height: 1.6,
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

class NewsItem {
  final String title;
  final String description;
  final String timestamp;
  final String category;

  NewsItem({
    required this.title,
    required this.description,
    required this.timestamp,
    required this.category,
  });
}
