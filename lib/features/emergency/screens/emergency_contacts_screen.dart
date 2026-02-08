import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/app_logo.dart';

/// Emergency Contacts Screen - সাইন আপ
class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addMoreNumber() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeNumber(int index) {
    if (_controllers.length > 3) {
      setState(() {
        _controllers[index].dispose();
        _controllers.removeAt(index);
      });
    }
  }

  void _onSubmit() {
    // Handle submit action
    final numbers = _controllers
        .map((controller) => controller.text)
        .where((text) => text.isNotEmpty)
        .toList();
    
    // TODO: Implement submit logic
    debugPrint('Emergency numbers: $numbers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.horizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),
              
              // Title
              const Text(
                'সাইন আপ',
                style: AppTextStyles.titleLarge,
              ),
              
              const SizedBox(height: AppSpacing.xl),
              
              // Red contact icon
              const AppLogo(size: AppSpacing.iconXxl),
              
              const SizedBox(height: AppSpacing.lg),
              
              // Instruction text
              const Text(
                '৩ টি ইমার্জেন্সি ফোন নম্বর দিন',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppSpacing.xl),
              
              // Number input fields (scrollable)
              Expanded(
                child: ListView.builder(
                  itemCount: _controllers.length,
                  itemBuilder: (context, index) {
                    final isLastField = index == _controllers.length - 1;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: CustomTextField(
                        controller: _controllers[index],
                        hintText: 'Number',
                        keyboardType: TextInputType.phone,
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_controllers.length > 3)
                              IconButton(
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  color: AppColors.textGrey,
                                ),
                                onPressed: () => _removeNumber(index),
                              ),
                            if (isLastField)
                              IconButton(
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  color: AppColors.primaryRed,
                                ),
                                onPressed: _addMoreNumber,
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: AppSpacing.md),
              
              // Add more button bar
              InkWell(
                onTap: _addMoreNumber,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(AppSpacing.inputBorderRadius),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textGrey,
                    size: AppSpacing.iconLg,
                  ),
                ),
              ),
              
              const SizedBox(height: AppSpacing.lg),
              
              // Submit button
              CustomButton(
                text: 'Submit',
                onPressed: _onSubmit,
              ),
              
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
