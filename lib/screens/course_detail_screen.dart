import 'package:flutter/material.dart';
import '../constants.dart';
import 'module_content_screen.dart';

class CourseDetailScreen extends StatelessWidget {
  final String title;
  final double progress;
  final Color iconColor;

  final List<Map<String, dynamic>> modules = const [
    {'number': 1, 'title': 'Pendahuluan', 'isCompleted': true},
    {'number': 2, 'title': 'Konsep Dasar', 'isCompleted': true},
    {'number': 3, 'title': 'Implementasi Lanjutan', 'isCompleted': false},
    {'number': 4, 'title': 'Studi Kasus', 'isCompleted': false},
    {'number': 5, 'title': 'Proyek Akhir', 'isCompleted': false},
  ];

  const CourseDetailScreen({
    super.key,
    required this.title,
    required this.progress,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: iconColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.book, size: 40, color: iconColor),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${(progress * 100).toInt()}% Selesai',
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Deskripsi Mata Kuliah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Mata kuliah ini dirancang untuk memberikan pemahaman mendalam tentang konsep dasar dan implementasi praktis. Mahasiswa akan belajar melalui serangkaian materi terstruktur, tugas praktikum, dan proyek akhir.',
              style: TextStyle(fontSize: 16, color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 30),
            const Text(
              'Modul Pembelajaran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            ...modules.asMap().entries.map((entry) {
              final index = entry.key;
              final module = entry.value;
              return _buildModuleItem(
                context,
                index,
                module['number'] as int,
                module['title'] as String,
                module['isCompleted'] as bool,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleItem(BuildContext context, int index, int number, String title, bool isCompleted) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ModuleContentScreen(
              modules: modules,
              currentIndex: index,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCompleted ? AppColors.secondary.withOpacity(0.5) : Colors.grey.withOpacity(0.2),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: isCompleted ? AppColors.secondary : Colors.grey.withOpacity(0.3),
              child: Icon(
                isCompleted ? Icons.check : Icons.lock_outline,
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                'Modul $number: $title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isCompleted ? AppColors.textPrimary : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
