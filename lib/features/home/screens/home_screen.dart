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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content based on selected tab
          _buildContent(),
          // Floating SOS button
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: SosButton(
                onPressed: () {
                  _showVictimBottomSheet();
                },
              ),
            ),
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

  Widget _buildContent() {
    return Column(
      children: [
        // App bar
        Container(
          padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
          color: const Color(0xFFD32F2F),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'প্রতিরক্ষা',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        // Map placeholder
        Expanded(
          child: Container(
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
                      const SizedBox(height: 8),
                      Text(
                        'আপনার অবস্থান এখানে দেখা যাবে',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                // User location marker
                const Positioned(
                  top: 100,
                  left: 100,
                  child: Icon(
                    Icons.my_location,
                    color: Color(0xFFD32F2F),
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
