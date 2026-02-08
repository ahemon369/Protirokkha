import 'package:flutter/material.dart';
import '../../../app/routes.dart';
import '../../../shared/widgets/custom_button.dart';

class KycVerificationScreen extends StatefulWidget {
  const KycVerificationScreen({super.key});

  @override
  State<KycVerificationScreen> createState() => _KycVerificationScreenState();
}

class _KycVerificationScreenState extends State<KycVerificationScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ভেরিফিকেশন'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Camera placeholder
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xFFD32F2F),
                    width: 4,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 80,
                  color: Color(0xFF757575),
                ),
              ),
              const SizedBox(height: 40),
              // Instructions
              const Text(
                'মুখ যাচাইকরণ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'ক্যামেরার সামনে আপনার মুখ রাখুন এবং ভেরিফাই করুন',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF757575),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              // Progress indicator
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: const Color(0xFFE0E0E0),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFD32F2F)),
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
              ),
              const Spacer(),
              // Verify button
              CustomButton(
                text: 'ভেরিফাই করুন',
                onPressed: () {
                  // Navigate to emergency contacts screen
                  Navigator.pushNamed(context, AppRoutes.emergencyContacts);
                },
                isLoading: _isLoading,
              ),
              const SizedBox(height: 12),
              // Skip button
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.emergencyContacts);
                },
                child: const Text(
                  'পরে করব',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 16,
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
