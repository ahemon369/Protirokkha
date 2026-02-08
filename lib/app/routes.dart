import 'package:flutter/material.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/auth/screens/phone_login_screen.dart';
import '../features/auth/screens/otp_verification_screen.dart';
import '../features/auth/screens/account_setup_screen.dart';
import '../features/kyc/screens/kyc_verification_screen.dart';
import '../features/emergency/screens/emergency_contacts_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/feed/screens/feed_screen.dart';
import '../features/profile/screens/profile_screen.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String phoneLogin = '/phone-login';
  static const String otpVerification = '/otp-verification';
  static const String accountSetup = '/account-setup';
  static const String kycVerification = '/kyc-verification';
  static const String emergencyContacts = '/emergency-contacts';
  static const String home = '/home';
  static const String feed = '/feed';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const OnboardingScreen(),
    phoneLogin: (context) => const PhoneLoginScreen(),
    otpVerification: (context) => const OtpVerificationScreen(),
    accountSetup: (context) => const AccountSetupScreen(),
    kycVerification: (context) => const KycVerificationScreen(),
    emergencyContacts: (context) => const EmergencyContactsScreen(),
    home: (context) => const HomeScreen(),
    feed: (context) => const FeedScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
