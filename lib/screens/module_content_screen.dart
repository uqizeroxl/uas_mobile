import 'package:flutter/material.dart';
import '../constants.dart';

class ModuleContentScreen extends StatelessWidget {
  final List<Map<String, dynamic>> modules;
  final int currentIndex;

  const ModuleContentScreen({
    super.key,
    required this.modules,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final module = modules[currentIndex];
    final moduleNumber = module['number'] as int;
    final moduleTitle = module['title'] as String;
    final hasPrevious = currentIndex > 0;
    final hasNext = currentIndex < modules.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Modul $moduleNumber', style: const TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              moduleTitle,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.play_circle_fill, size: 64, color: AppColors.primary),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Video Pembelajaran',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Materi Bacaan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Pada modul ini, kita akan membahas konsep-konsep fundamental yang menjadi dasar dari topik ini. Pemahaman yang kuat tentang materi ini sangat penting untuk melanjutkan ke modul-modul berikutnya.\n\n'
              'Poin-poin utama yang akan dipelajari:\n'
              '1. Definisi dan Sejarah\n'
              '2. Komponen Utama\n'
              '3. Implementasi Sederhana\n'
              '4. Studi Kasus Industri\n\n'
              'Silakan pelajari materi di atas dan tonton video penjelasan untuk pemahaman yang lebih baik.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                if (hasPrevious)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModuleContentScreen(
                              modules: modules,
                              currentIndex: currentIndex - 1,
                            ),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Sebelumnya',
                        style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                else
                  const Spacer(),
                if (hasPrevious && hasNext) const SizedBox(width: 16),
                if (hasNext)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModuleContentScreen(
                              modules: modules,
                              currentIndex: currentIndex + 1,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Selanjutnya',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                else
                  const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
