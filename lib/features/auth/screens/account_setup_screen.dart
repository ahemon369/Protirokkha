import 'package:flutter/material.dart';
import '../../../app/routes.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_text_field.dart';

class AccountSetupScreen extends StatefulWidget {
  const AccountSetupScreen({super.key});

  @override
  State<AccountSetupScreen> createState() => _AccountSetupScreenState();
}

class _AccountSetupScreenState extends State<AccountSetupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  
  String? _selectedGender;
  final List<String> _genderOptions = ['পুরুষ', 'মহিলা', 'অন্যান্য'];
  bool _isLoading = false;

  Future<void> _selectBirthday() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _birthdayController.text = '${date.day}/${date.month}/${date.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Title
                      const Text(
                        'সাইন আপ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF212121),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Red contact icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD32F2F),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD32F2F).withOpacity(0.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 45,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Instruction
                      const Text(
                        'আপনার NID এর সাথে মিল রেখে সব তথ্য দিন',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF757575),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Name field
                      CustomTextField(
                        controller: _nameController,
                        labelText: 'নাম',
                        hintText: 'আপনার পূর্ণ নাম লিখুন',
                        helperText: 'সঠিক নাম লিখুন',
                        suffixIcon: _nameController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _nameController.clear();
                                  });
                                },
                              )
                            : null,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 16),
                      // Email field
                      CustomTextField(
                        controller: _emailController,
                        labelText: 'ইমেইল',
                        hintText: 'example@email.com',
                        helperText: 'সঠিক ইমেইল ঠিকানা প্রদান করুন',
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: _emailController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 20),
                                onPressed: () {
                                  setState(() {
                                    _emailController.clear();
                                  });
                                },
                              )
                            : null,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(height: 16),
                      // Birthday and Gender row
                      Row(
                        children: [
                          // Birthday field
                          Expanded(
                            child: CustomTextField(
                              controller: _birthdayController,
                              labelText: 'জন্মদিন',
                              hintText: 'তারিখ নির্বাচন করুন',
                              readOnly: true,
                              onTap: _selectBirthday,
                              suffixIcon: const Icon(Icons.calendar_today, size: 20),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Gender dropdown
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: _selectedGender,
                              decoration: InputDecoration(
                                labelText: 'লিঙ্গ',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFD32F2F),
                                    width: 2,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                              ),
                              items: _genderOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedGender = newValue;
                                });
                              },
                              hint: const Text('নির্বাচন করুন'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Submit button at bottom
              const SizedBox(height: 20),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _birthdayController.text.isEmpty ||
                      _selectedGender == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('সব তথ্য পূরণ করুন'),
                      ),
                    );
                    return;
                  }
                  Navigator.pushNamed(context, AppRoutes.kycVerification);
                },
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }
}
