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

    // Verify that our home tab is showing (Incoming Course text)
    expect(find.text('Jadwal Masuk'), findsOneWidget);
    expect(find.text('Kursus Tab'), findsNothing);

    // Verify AppBar content
    expect(find.text('Hai, Alvin'), findsOneWidget);
    // There might be multiple person icons (AppBar + Cards), check for at least one or specify key
    expect(find.byIcon(Icons.person), findsAtLeastNWidgets(1));

    // Tap the Course icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.menu_book_rounded));
    await tester.pump();

    // Verify that our Course tab is showing (Check for a course title only present in the list)
    expect(find.text('Basis Data'), findsOneWidget); // Found in CourseScreen but not HomeScreen
    expect(find.text('Jadwal Masuk'), findsNothing);

    // Tap on a CourseCard to open CourseDetailScreen
    await tester.tap(find.text('Basis Data'));
    await tester.pumpAndSettle(); // Wait for navigation animation

    // Verify CourseDetailScreen is shown (Check for description header)
    expect(find.text('Deskripsi Mata Kuliah'), findsOneWidget);
    expect(find.text('Basis Data'), findsAtLeastNWidgets(1)); // Title should be present

    // Tap on a Module item to open ModuleContentScreen
    await tester.tap(find.text('Modul 1: Pendahuluan'));
    await tester.pumpAndSettle();

    // Verify ModuleContentScreen is shown
    expect(find.text('Pendahuluan'), findsOneWidget); // Module title
    expect(find.text('Materi Bacaan'), findsOneWidget); // Section header
    expect(find.byIcon(Icons.play_circle_fill), findsOneWidget); // Video placeholder

    // Check navigation buttons (Should show Next only for 1st module)
    expect(find.text('Selanjutnya'), findsOneWidget);
    expect(find.text('Sebelumnya'), findsNothing);

    // Scroll until "Selanjutnya" is visible and tap it
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -500));
    await tester.pumpAndSettle();
    
    await tester.tap(find.text('Selanjutnya'));
    await tester.pumpAndSettle();

    // Verify next module is shown
    expect(find.text('Konsep Dasar'), findsOneWidget); // Module 2 title
    expect(find.text('Sebelumnya'), findsOneWidget); // Now Previous should be visible
  });
}
