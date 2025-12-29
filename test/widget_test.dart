// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:uas_mobile/main.dart';

void main() {
  testWidgets('BaseScreen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our home tab is showing.
    expect(find.text('Home Tab'), findsOneWidget);
    expect(find.text('Course Tab'), findsNothing);

    // Tap the Course icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.menu_book_rounded));
    await tester.pump();

    // Verify that our Course tab is showing.
    expect(find.text('Course Tab'), findsOneWidget);
  });
}
