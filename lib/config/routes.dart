import 'package:flutter/material.dart';
import '../features/emergency/screens/emergency_contacts_screen.dart';
import '../features/kyc/screens/kyc_verification_screen.dart';
import '../features/home/screens/home_screen.dart';

/// App routes configuration
class AppRoutes {
  static const String home = '/';
  static const String emergencyContacts = '/emergency-contacts';
  static const String kycVerification = '/kyc-verification';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const HomeScreen(),
      emergencyContacts: (context) => const EmergencyContactsScreen(),
      kycVerification: (context) => const KycVerificationScreen(),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // Handle dynamic routes if needed
    return null;
  }
}
