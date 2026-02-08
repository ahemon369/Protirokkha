import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('প্রোফাইল'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('সম্পাদনা ফিচার শীঘ্রই আসছে')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Avatar
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFFD32F2F),
                        child: const Text(
                          'ম',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFF388E3C),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.verified,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Name
                  const Text(
                    'মোহাম্মদ রহিম',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Phone
                  const Text(
                    '+৮৮ ০১৮৩৮৮৪৫৯৬০',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('১২', 'সাহায্য করেছি'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      _buildStatItem('৫', 'জরুরি পরিচিতি'),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey.shade300,
                      ),
                      _buildStatItem('৪.৮', 'রেটিং'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Settings list
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildSettingsItem(
                    context,
                    icon: Icons.language,
                    title: 'ভাষা',
                    subtitle: 'বাংলা',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    context,
                    icon: Icons.notifications,
                    title: 'নোটিফিকেশন',
                    subtitle: 'সব নোটিফিকেশন চালু',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    context,
                    icon: Icons.contacts_rounded,
                    title: 'জরুরি পরিচিতি',
                    subtitle: '৫টি পরিচিতি যোগ করা হয়েছে',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    context,
                    icon: Icons.privacy_tip,
                    title: 'গোপনীয়তা',
                    subtitle: 'গোপনীয়তা সেটিংস',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    context,
                    icon: Icons.security,
                    title: 'নিরাপত্তা',
                    subtitle: 'অ্যাকাউন্ট নিরাপত্তা',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    context,
                    icon: Icons.help,
                    title: 'সাহায্য',
                    subtitle: 'সাহায্য কেন্দ্র',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildSettingsItem(
                    context,
                    icon: Icons.info,
                    title: 'অ্যাপ সম্পর্কে',
                    subtitle: 'সংস্করণ ১.০.০',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Logout button
            Container(
              color: Colors.white,
              child: _buildSettingsItem(
                context,
                icon: Icons.logout,
                title: 'লগ আউট',
                subtitle: '',
                onTap: () {
                  _showLogoutDialog(context);
                },
                iconColor: const Color(0xFFD32F2F),
                textColor: const Color(0xFFD32F2F),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF212121),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF757575),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Icon(
        icon,
        color: iconColor ?? const Color(0xFF757575),
        size: 28,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? const Color(0xFF212121),
        ),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF757575),
              ),
            )
          : null,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey.shade400,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Divider(
        height: 1,
        color: Colors.grey.shade200,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('লগ আউট করুন?'),
        content: const Text('আপনি কি নিশ্চিত আপনি লগ আউট করতে চান?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('বাতিল'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/',
                (route) => false,
              );
            },
            child: const Text(
              'লগ আউট',
              style: TextStyle(color: Color(0xFFD32F2F)),
            ),
          ),
        ],
      ),
    );
  }
}
