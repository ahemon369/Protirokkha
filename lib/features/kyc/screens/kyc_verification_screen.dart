import 'package:flutter/material.dart';
import '../../../app/routes.dart';
import '../../../shared/widgets/custom_button.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({super.key});

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF212121)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ছবি তুলুন',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              // Camera circle with viewfinder corners
              Stack(
                alignment: Alignment.center,
                children: [
                  // Main grey circle with face icon
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.face,
                      size: 100,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                  // Top-left corner bracket
                  Positioned(
                    top: 0,
                    left: 0,
                    child: _buildCornerBracket(true, true),
                  ),
                  // Top-right corner bracket
                  Positioned(
                    top: 0,
                    right: 0,
                    child: _buildCornerBracket(true, false),
                  ),
                  // Bottom-left corner bracket
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: _buildCornerBracket(false, true),
                  ),
                  // Bottom-right corner bracket
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: _buildCornerBracket(false, false),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Info tips row
              InkWell(
                onTap: () {
                  _showPhotoTips();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFF2196F3),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'ছবি তোলার টিপস',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF212121),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Instruction text
              const Text(
                'আপনার পরিচয় যাচাই করার জন্য আমাদের আপনার সেলফি প্রয়োজন',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
              ),
              const Spacer(),
              // Start button
              CustomButton(
                text: 'Start',
                onPressed: () {
                  // Navigate to emergency contacts screen
                  Navigator.pushNamed(context, AppRoutes.emergencyContacts);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build corner brackets/viewfinder marks
  Widget _buildCornerBracket(bool isTop, bool isLeft) {
    return SizedBox(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: _CornerBracketPainter(isTop: isTop, isLeft: isLeft),
      ),
    );
  }

  void _showPhotoTips() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Color(0xFF2196F3)),
            SizedBox(width: 8),
            Text('ছবি তোলার টিপস'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• পর্যাপ্ত আলোতে ছবি তুলুন'),
            SizedBox(height: 8),
            Text('• আপনার মুখ পরিষ্কারভাবে দেখা যায় তা নিশ্চিত করুন'),
            SizedBox(height: 8),
            Text('• চশমা বা টুপি খুলে ছবি তুলুন'),
            SizedBox(height: 8),
            Text('• ক্যামেরার দিকে সরাসরি তাকান'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('বুঝেছি'),
          ),
        ],
      ),
    );
  }
}

// Custom painter for corner brackets
class _CornerBracketPainter extends CustomPainter {
  final bool isTop;
  final bool isLeft;

  _CornerBracketPainter({required this.isTop, required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD32F2F)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    if (isTop && isLeft) {
      // Top-left corner
      path.moveTo(size.width, 0);
      path.lineTo(0, 0);
      path.lineTo(0, size.height);
    } else if (isTop && !isLeft) {
      // Top-right corner
      path.moveTo(0, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
    } else if (!isTop && isLeft) {
      // Bottom-left corner
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else {
      // Bottom-right corner
      path.moveTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
