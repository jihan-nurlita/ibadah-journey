import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/pages/target/models/target_model.dart';

import 'package:ibadah_journey/pages/target/data/target_data.dart';

class WeeklySection extends StatefulWidget {
  const WeeklySection({super.key});

  @override
  State<WeeklySection> createState() => _WeeklySectionState();
}

class CategoryProgress {
  final String name;
  final double progress;
  final int done;
  final int total;

  CategoryProgress({
    required this.name,
    required this.progress,
    required this.done,
    required this.total,
  });
}

class _WeeklySectionState extends State<WeeklySection> {
  // Progress category
  List<CategoryProgress> getCategoryProgress(List<TargetModel> targetList) {
    final Map<String, List<TargetModel>> grouped = {};

    for (var t in targetList) {
      grouped.putIfAbsent(t.category, () => []);
      grouped[t.category]!.add(t);
    }

    return grouped.entries.map((e) {
      final total = e.value.length;
      final done = e.value.where((t) => t.isDone).length;

      return CategoryProgress(
        name: e.key,
        progress: total == 0 ? 0 : done / total,
        done: done,
        total: total,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProgress = getCategoryProgress(targetList);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            // 🔥 streak
            const SizedBox(height: 5),

            /// STREAK CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4A9B78),
                    Color(0xff2E7D5A),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.orange,
                      size: 38,
                    ),
                  ),
                  const SizedBox(width: 18),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Streak Ibadah',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '12 Hari Berturut-turut',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Terus pertahankan ibadahmu ✨',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 14,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Statistik Mingguan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      _BarItem(day: 'Sen', value: 0.7),
                      _BarItem(day: 'Sel', value: 0.5),
                      _BarItem(day: 'Rab', value: 0.9),
                      _BarItem(day: 'Kam', value: 0.6),
                      _BarItem(day: 'Jum', value: 1),
                      _BarItem(day: 'Sab', value: 0.8),
                      _BarItem(day: 'Min', value: 0.4),
                    ],
                  ),
                ],
              ),
            ),

            // 📝 Ringkasan Minggu ini
            const SizedBox(height: 20),

            /// ACHIEVEMENT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 14,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan Mingguan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: _completeCard(
                          titleText: 'Total Ibadah',
                          title: '45',
                          subtitle: 'Kali',
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _completeCard(
                          titleText: 'Target Selesai',
                          title: '27',
                          subtitle: 'Dari 35',
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: _completeCard(
                          titleText: 'Streak Minggu Ini',
                          title: '5',
                          subtitle: 'Hari',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 14,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  const Text(
                    'Progress Per Kategori',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...categoryProgress.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: _CategoryProgressItem(
                        data: item,
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),

            // 🔥 streak
            const SizedBox(height: 24),

            /// STREAK CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4A9B78),
                    Color(0xff2E7D5A),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.orange,
                      size: 38,
                    ),
                  ),
                  const SizedBox(width: 18),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Streak Ibadah',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '12 Hari Berturut-turut',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Terus pertahankan ibadahmu ✨',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final String day;
  final double value;

  const _BarItem({
    required this.day,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 22,
          height: 120 * value,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          day,
          style: const TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// Category
class _CategoryProgressItem extends StatelessWidget {
  final CategoryProgress data;

  const _CategoryProgressItem({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (data.progress * 100).toInt();

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          /// ICON
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              _getIcon(data.name),
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 14),

          /// TEXT SECTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                /// DONE / TOTAL
                Text(
                  '${data.done}/${data.total} Hari',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 3),

                /// PROGRESS BAR + PERCENT
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: data.progress,
                          minHeight: 7,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: const AlwaysStoppedAnimation(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$percent%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String category) {
    switch (category) {
      case 'Sholat':
        return Icons.mosque;
      case 'Quran':
        return Icons.menu_book;
      case 'Dzikir':
        return Icons.favorite;
      case 'Puasa':
        return Icons.nightlight_round;
      case 'Sedekah':
        return Icons.volunteer_activism;
      default:
        return Icons.check_circle;
    }
  }
}

// Ringkasan Minggu ini
Widget _completeCard({
  required String titleText,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 12,
    ),
    decoration: BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 7),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
