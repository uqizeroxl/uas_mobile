import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/course_card.dart';
import 'course_detail_screen.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {'title': 'Struktur Data', 'progress': 0.75, 'color': Colors.blue},
      {'title': 'Pemrograman Web', 'progress': 0.45, 'color': Colors.orange},
      {'title': 'Algoritma', 'progress': 0.90, 'color': Colors.purple},
      {'title': 'Basis Data', 'progress': 0.30, 'color': Colors.red},
      {'title': 'Jaringan Komputer', 'progress': 0.60, 'color': Colors.green},
      {'title': 'Kecerdasan Buatan', 'progress': 0.20, 'color': Colors.teal},
      {'title': 'Sistem Operasi', 'progress': 0.50, 'color': Colors.indigo},
      {'title': 'Matematika Diskrit', 'progress': 0.85, 'color': Colors.amber},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CourseCard(
              title: course['title'] as String,
              progress: course['progress'] as double,
              iconColor: course['color'] as Color,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailScreen(
                      title: course['title'] as String,
                      progress: course['progress'] as double,
                      iconColor: course['color'] as Color,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
