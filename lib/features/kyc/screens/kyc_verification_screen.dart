import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/custom_button.dart';

/// KYC / Face Verification Screen - ছবি তুলুন
class KycVerificationScreen extends StatelessWidget {
  const KycVerificationScreen({super.key});

  void _onStart(BuildContext context) {
    // TODO: Implement start camera action
    debugPrint('Starting face verification');
  }

  void _showPhotoTips(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ছবি তোলার টিপস'),
        content: const Text(
          '১. ভাল আলো নিশ্চিত করুন\n'
          '২. সরাসরি ক্যামেরার দিকে তাকান\n'
          '৩. নিজের মুখ ফ্রেমের মধ্যে রাখুন\n'
          '৪. চশমা এবং মুখোশ সরান',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ঠিক আছে'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ছবি তুলুন',
          style: AppTextStyles.title,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.horizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Large circle with face icon and scanning brackets
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Grey circle background
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 100,
                        color: AppColors.textDark,
                      ),
                    ),
                    
                    // Scanning brackets/corners
                    ...List.generate(4, (index) {
                      // Calculate position for each corner
                      final isTop = index < 2;
                      final isLeft = index % 2 == 0;
                      
                      return Positioned(
                        top: isTop ? 0 : null,
                        bottom: !isTop ? 0 : null,
                        left: isLeft ? 0 : null,
                        right: !isLeft ? 0 : null,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              top: isTop
                                  ? const BorderSide(
                                      color: AppColors.primaryRed,
                                      width: 3,
                                    )
                                  : BorderSide.none,
                              bottom: !isTop
                                  ? const BorderSide(
                                      color: AppColors.primaryRed,
                                      width: 3,
                                    )
                                  : BorderSide.none,
                              left: isLeft
                                  ? const BorderSide(
                                      color: AppColors.primaryRed,
                                      width: 3,
                                    )
                                  : BorderSide.none,
                              right: !isLeft
                                  ? const BorderSide(
                                      color: AppColors.primaryRed,
                                      width: 3,
                                    )
                                  : BorderSide.none,
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              
              const SizedBox(height: AppSpacing.xl),
              
              // Photo tips clickable row
              InkWell(
                onTap: () => _showPhotoTips(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.primaryRed,
                      size: AppSpacing.iconMd,
                    ),
                    SizedBox(width: AppSpacing.xs),
                    Text(
                      'ছবি তোলার টিপস',
                      style: TextStyle(
                        color: AppColors.primaryRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: AppSpacing.lg),
              
              // Instruction text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text(
                  'আপনার পরিচয় যাচাই করার জন্য আমাদের আপনার সেলফি প্রয়োজন',
                  style: AppTextStyles.bodyGrey,
                  textAlign: TextAlign.center,
                ),
              ),
              
              const Spacer(),
              
              // Start button
              CustomButton(
                text: 'Start',
                onPressed: () => _onStart(context),
              ),
              
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
