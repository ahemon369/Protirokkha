import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const ProtirokkhaApp());
}

class ProtirokkhaApp extends StatelessWidget {
  const ProtirokkhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Protirokkha',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
