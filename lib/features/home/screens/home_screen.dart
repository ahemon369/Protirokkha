import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';

/// Home Screen with map, defenders info, and draggable bottom sheet
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Toggle between states: defenders nearby or no defenders
  bool hasDefendersNearby = true;
  bool isNearbyPeopleChecked = true;

  void _toggleDefendersState() {
    setState(() {
      hasDefendersNearby = !hasDefendersNearby;
    });
  }

  void _onHelpPressed() {
    // TODO: Implement emergency help action
    debugPrint('Emergency help requested!');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('সাহায্য চাই!'),
        content: const Text('জরুরি সাহায্যের অনুরোধ পাঠানো হচ্ছে...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('বাতিল করুন'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Send emergency alert
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
            ),
            child: const Text('নিশ্চিত করুন'),
          ),
        ],
      ),
    );
  }

  void _onInvitePressed() {
    // TODO: Implement invite friends action
    debugPrint('Invite friends pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map area
          _buildMapArea(),
          
          // Top app bar
          _buildTopAppBar(),
          
          // Helpline badge
          _buildHelplineBadge(),
          
          // Draggable bottom sheet
          _buildBottomSheet(),
        ],
      ),
    );
  }

  Widget _buildMapArea() {
    return Container(
      color: AppColors.lightGrey,
      child: Stack(
        children: [
          // Map placeholder with text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.map,
                  size: 80,
                  color: AppColors.textGrey,
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Chattogram Area',
                  style: AppTextStyles.bodyGrey,
                ),
              ],
            ),
          ),
          
          // Green zone overlay (if defenders nearby)
          if (hasDefendersNearby)
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryGreen.withOpacity(0.2),
                  border: Border.all(
                    color: AppColors.secondaryGreen.withOpacity(0.5),
                    width: 2,
                  ),
                ),
              ),
            ),
          
          // Markers
          if (hasDefendersNearby)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35,
              left: MediaQuery.of(context).size.width * 0.4,
              child: _buildDefenderMarker(),
            ),
          
          // Help marker (example position)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: _buildHelpMarker(),
          ),
          
          // User location pin
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.45,
            child: const Icon(
              Icons.location_pin,
              color: AppColors.primaryRed,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefenderMarker() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryGreen,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(
            Icons.shield,
            color: AppColors.white,
            size: 16,
          ),
          SizedBox(width: 4),
          Text(
            'প্রতিরক্ষক',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4),
          Text(
            '6',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpMarker() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.warningOrange,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Text(
        'সাহায্য চাই!',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTopAppBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          color: AppColors.white.withOpacity(0.95),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.textDark),
                onPressed: () {
                  // TODO: Open drawer
                },
              ),
              Expanded(
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: AppColors.textGrey, size: 20),
                      SizedBox(width: AppSpacing.xs),
                      Text(
                        'Search location',
                        style: TextStyle(
                          color: AppColors.textGrey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: AppColors.textDark),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.group_outlined, color: AppColors.textDark),
                onPressed: () {},
              ),
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.primaryRed,
                child: const Icon(Icons.person, color: AppColors.white, size: 20),
              ),
              IconButton(
                icon: const Icon(Icons.share_outlined, color: AppColors.textDark),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelplineBadge() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 70,
      right: AppSpacing.md,
      child: GestureDetector(
        onTap: _toggleDefendersState, // For demo: toggle state
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: AppColors.warningYellow,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Text(
            'হেল্পলাইন',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.25,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalPadding,
            ),
            children: [
              // Drag handle
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              
              // Content based on state
              if (!hasDefendersNearby) ...[
                // Yellow invite banner
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.warningYellow.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'আপনার বন্ধু বা বান্ধুদের এখনই অ্যাপে আমন্ত্রণ জানিয়ে প্রতিরক্ষা বলয় তৈরী করুন',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _onInvitePressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.warningOrange,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          minimumSize: Size.zero,
                        ),
                        child: const Text(
                          'Invite',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                
                // Warning row - no defenders
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.warningOrange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.warningOrange.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: AppColors.warningOrange,
                        size: AppSpacing.iconMd,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          'আপনার আশে পাশে কোনো প্রতিরক্ষক নেই',
                          style: TextStyle(
                            color: AppColors.warningOrange,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                // Green info rows - defenders active
                _buildInfoRow(
                  icon: Icons.shield,
                  text: '৬ প্রতিরক্ষক আপনার সবুজ জোনে আছেন',
                  color: AppColors.secondaryGreen,
                ),
                const SizedBox(height: AppSpacing.sm),
                _buildInfoRow(
                  icon: Icons.shield,
                  text: '৪৫ প্রতিরক্ষক আপনার শহরে আছেন',
                  color: AppColors.secondaryGreen,
                ),
              ],
              
              const SizedBox(height: AppSpacing.md),
              
              // Checkbox row
              Row(
                children: [
                  Checkbox(
                    value: isNearbyPeopleChecked,
                    onChanged: (value) {
                      setState(() {
                        isNearbyPeopleChecked = value ?? false;
                      });
                    },
                    activeColor: AppColors.secondaryGreen,
                  ),
                  const Text(
                    '৫ জন কাছের মানুষ',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              
              const SizedBox(height: AppSpacing.sm),
              
              // Helper text
              const Text(
                'জরুরি সাহায্য নিতে ট্যাপ করুন ↓',
                style: AppTextStyles.bodyGreySmall,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppSpacing.md),
              
              // Emergency help button
              CustomButton(
                text: 'সাহায্য চাই',
                onPressed: _onHelpPressed,
                leadingIcon: const Icon(
                  Icons.star,
                  color: AppColors.white,
                  size: AppSpacing.iconMd,
                ),
              ),
              
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: AppSpacing.iconMd,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
