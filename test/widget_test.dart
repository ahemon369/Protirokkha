import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protirokkha/main.dart';
import 'package:protirokkha/features/home/screens/home_screen.dart';

void main() {
  testWidgets('App starts and shows home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProtirokkhaApp());

    // Verify that the app starts
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Verify the home screen is displayed
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
