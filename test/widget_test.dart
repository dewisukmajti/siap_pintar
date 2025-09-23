import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:siap_pintar/main.dart';

void main() {
  testWidgets('App should start with onboarding screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SiapPintarApp());

    // Verify that onboarding screen elements are present
    // You can adjust these based on your onboarding content
    expect(find.text('Skip'), findsOneWidget);
    
    // If you have specific text in your onboarding, test for it
    // Example: expect(find.text('Learn Better with Expert Mentors'), findsOneWidget);
  });
  
  testWidgets('Navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SiapPintarApp());

    // Test navigation by tapping Skip button
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle(); // Wait for navigation animation

    // Verify we're now on the welcome/login screen
    expect(find.text('Welcome'), findsOneWidget);
    expect(find.text('Choose your preferred sign in method'), findsOneWidget);
  });
}