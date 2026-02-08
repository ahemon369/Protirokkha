import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  String selectedCategory = 'News';
  
  final List<Map<String, String>> newsItems = [
    {
      'title': 'মোটরসাইকেল থেকে নামিয়ে তরুণকে এলোপাতাড়ি কোপ, হাসপাতালে মৃত্যু',
      'author': 'লেখক: আশফুল কুদ্দুস',
      'date': '১২-০৯-২৫',
    },
    {
      'title': 'চুরির অভিযোগে সালিসের পর গাছে ঝুলছিল যুবকের লাশ',
      'author': 'লেখক: মাহমুদ হাসান',
      'date': '১১-০৯-২৫',
    },
    {
      'title': 'নোয়াখালী বিভাগের দাবিতে মাইজদীতে বিক্ষোভ',
      'author': 'লেখক: রাকিব হোসেন',
      'date': '১০-০৯-২৫',
    },
    {
      'title': '\'বন্ধুকে ভিডিও কলে\' রেখে বিশ্ববিদ্যালয় ছাত্রীর গলায় ফাঁস',
      'author': 'লেখক: সাদিয়া আফরিন',
      'date': '০৯-০৯-২৫',
    },
    {
      'title': 'নোয়াখালীতে প্রশিক্ষণের গাড়ি পুকুরে পড়ে তরুণের মৃত্যু',
      'author': 'লেখক: আবদুল্লাহ আল মামুন',
      'date': '০৮-০৯-২৫',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search news',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Chips
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryChip('News', null),
                const SizedBox(width: 8),
                _buildCategoryChip('OSINT', Icons.group),
                const SizedBox(width: 8),
                _buildCategoryChip('Global', null),
                const SizedBox(width: 8),
                _buildCategoryChip('Trending', null),
              ],
            ),
          ),
          const Divider(height: 1),
          // News List
          Expanded(
            child: ListView.builder(
              itemCount: newsItems.length,
              itemBuilder: (context, index) {
                return _buildNewsCard(newsItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData? icon) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: Colors.black),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(Map<String, String> news) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail with gradient
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                colors: [Color(0xFFEF5350), Color(0xFF4CAF50)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // News content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news['title']!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.3,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '${news['author']} | ${news['date']}',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
