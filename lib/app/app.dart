import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';

class ProtirokkhaApp extends StatelessWidget {
  const ProtirokkhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protirokkha',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.onboarding,
      routes: AppRoutes.routes,
    );
  }
}
