import 'package:flutter/material.dart';
import '../../../app/routes.dart';
import '../../sos/widgets/sos_button.dart';
import '../../sos/widgets/victim_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  // Toggle this flag to test both UI states (defenders active vs no defenders)
  // In production, this should be populated from backend/location service
  bool hasDefendersNearby = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          Column(
            children: [
              _buildTopBar(),
              Expanded(
                child: Stack(
                  children: [
                    _buildMapPlaceholder(),
                    _buildBottomSheet(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          // Navigate to different screens
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.feed);
          } else if (index == 3) {
            Navigator.pushNamed(context, AppRoutes.profile);
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFD32F2F),
        unselectedItemColor: const Color(0xFF757575),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'হোম',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'ফিড',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'জরুরি',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'প্রোফাইল',
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF212121)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF212121)),
            onPressed: () {},
          ),
          const Spacer(),
          // Yellow helpline badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'হেল্পলাইন',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF212121)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.group_outlined, color: Color(0xFF212121)),
            onPressed: () {},
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: const Color(0xFFD32F2F),
            child: const Icon(Icons.person, size: 20, color: Colors.white),
          ),
          const SizedBox(width: 4),
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF212121)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      color: const Color(0xFFE0E0E0),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.map,
                  size: 100,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(height: 16),
                Text(
                  'Google Maps Placeholder',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Green zone overlay (circle)
          Positioned(
            top: 150,
            left: 80,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: const Color(0xFF388E3C).withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF388E3C),
                  width: 2,
                ),
              ),
            ),
          ),
          // User location marker
          const Positioned(
            top: 240,
            left: 170,
            child: Icon(
              Icons.my_location,
              color: Color(0xFFD32F2F),
              size: 40,
            ),
          ),
          // Defender markers (if defenders nearby)
          if (hasDefendersNearby) ...[
            const Positioned(
              top: 200,
              left: 120,
              child: Icon(
                Icons.person_pin_circle,
                color: Color(0xFF388E3C),
                size: 30,
              ),
            ),
            const Positioned(
              top: 180,
              left: 200,
              child: Icon(
                Icons.person_pin_circle,
                color: Color(0xFF388E3C),
                size: 30,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.7,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    if (hasDefendersNearby)
                      _buildDefendersActiveState()
                    else
                      _buildNoDefendersState(),
                    const SizedBox(height: 24),
                    // Red "সাহায্য চাই" button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          _showVictimBottomSheet();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD32F2F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'সাহায্য চাই',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDefendersActiveState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Green info rows
        _buildInfoRow(
          Icons.shield,
          '৬ প্রতিরক্ষক আপনার সবুজ জোনে আছেন',
          const Color(0xFF388E3C),
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.location_city,
          '৪৫ প্রতিরক্ষক আপনার শহরে আছেন',
          const Color(0xFF388E3C),
        ),
        const SizedBox(height: 12),
        // Checkbox row
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: const Color(0xFF388E3C),
              ),
              const SizedBox(width: 8),
              const Text(
                '৫ জন কাছের মানুষ',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF212121),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNoDefendersState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Yellow invite banner
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC107),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.person_add,
                color: Colors.black87,
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'বন্ধুদের আমন্ত্রণ জানান',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black87,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Orange warning row
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFFF9800).withOpacity(0.1),
            border: Border.all(
              color: const Color(0xFFFF9800),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Color(0xFFFF9800),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'আপনার আশে পাশে কোনো প্রতিরক্ষক নেই',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF212121),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF212121),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showVictimBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const VictimBottomSheet(),
    );
  }
}
