// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';

class MonthlySection extends StatefulWidget {
  const MonthlySection({super.key});

  @override
  State<MonthlySection> createState() => _MonthlySectionState();
}

class _MonthlySectionState extends State<MonthlySection> {
  // final PageController _pageController = PageController(initialPage: 1000);

  final DateTime baseDate = DateTime.now();

  int? selectedDay;

  int get totalItems => daysInMonth + (firstWeekday - 1); // TOTAL GRID

  // Hitung Bulan
  DateTime getMonthDate(int index) {
    return DateTime(
      baseDate.year,
      baseDate.month + (index - 1000),
      1,
    );
  }

  // LOGIC REAL CALENDAR
  DateTime now = DateTime.now();

  late int daysInMonth;
  late int firstWeekday; // posisi hari pertama (Senin/Minggu)

  // late List<DailyIbadah> data;

  late final List<DailyIbadah> data;

  @override
  void initState() {
    super.initState();

    final firstDayOfMonth = DateTime(now.year, now.month, 1);

    daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    firstWeekday = firstDayOfMonth.weekday;

    data = List.generate(
      daysInMonth,
      (index) => DailyIbadah(
        day: index + 1,
        isDone: index % 3 != 0,
        totalActivity: (index % 5) + 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // 📅 kalender bulanan
          const SizedBox(height: 5),

          /// MONTHLY ACTIVITY
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
                  'Aktivitas Bulanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    // HEADER HARI
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 7,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                      ),
                      itemBuilder: (context, index) {
                        const days = [
                          "Min ",
                          "Sen ",
                          "Sel ",
                          "Rab ",
                          "Kam",
                          " Jum",
                          " Sab"
                        ];

                        return Center(
                          child: Text(
                            days[index],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 3),

                    // GRID CALENDAR
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: totalItems,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        // kosongin awal bulan
                        if (index < firstWeekday - 1) {
                          return const SizedBox();
                        }

                        final day = index - (firstWeekday - 2);

                        final item = data[day - 1];

                        final isToday = day == now.day &&
                            now.month == DateTime.now().month &&
                            now.year == DateTime.now().year;

                        final isSelected = selectedDay == day;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDay = day;
                            });

                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25)),
                              ),
                              builder: (_) => _DailyDetailSheet(data: item),
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.orange
                                  : isToday
                                      ? Colors.blue.withOpacity(0.8)
                                      : item.isDone
                                          ? AppColors.primary
                                          : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "$day",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (isSelected || item.isDone || isToday)
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),

          // 📅 kalender progress bulanan
          const SizedBox(height: 24),

          /// MONTHLY ACTIVITY
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
                  'Aktivitas Bulanan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    30,
                    (index) {
                      final active = index % 3 != 0;

                      return Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          color:
                              active ? AppColors.primary : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // 🏆 achievement
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
                  'Achievement',
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
                      child: _achievementCard(
                        icon: Icons.local_fire_department_rounded,
                        title: '7 Hari',
                        subtitle: 'Streak',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _achievementCard(
                        icon: Icons.menu_book_rounded,
                        title: '30x',
                        subtitle: 'Khatam',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _achievementCard(
                        icon: Icons.star_rounded,
                        title: 'Level 5',
                        subtitle: 'Muslim',
                      ),
                    ),
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
                  'Ringkasan Bulanan Ini',
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
                        title: '215',
                        subtitle: 'Kali',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _completeCard(
                        titleText: 'Target Selesai',
                        title: '85%',
                        subtitle: 'Dari 100%',
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: _completeCard(
                        titleText: 'Streak Minggu Ini',
                        title: '16',
                        subtitle: 'Hari',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 🔥 Level
          const SizedBox(height: 24),

          /// LEVEL CARD
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.emoji_events_rounded,
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
                            'Level Muslim',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Level 5',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '1250 / 2000 XP',
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
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: const LinearProgressIndicator(
                    value: 0.4,
                    minHeight: 10,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

// 📅 MODEL DATA
class DailyIbadah {
  final int day;
  final bool isDone;
  final int totalActivity;

  DailyIbadah({
    required this.day,
    required this.isDone,
    required this.totalActivity,
  });
}

// Bottom Sheet DETAIL IBADAH HARIAN
class _DailyDetailSheet extends StatelessWidget {
  final DailyIbadah data;

  const _DailyDetailSheet({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Ibadah Hari ke-${data.day}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              const SizedBox(width: 8),
              Text(
                data.isDone ? "Target Tercapai" : "Belum Tercapai",
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.list_alt, color: Colors.orange),
              const SizedBox(width: 8),
              Text("Total Aktivitas: ${data.totalActivity}"),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// HELPER 🏆 achievement
Widget _achievementCard({
  required IconData icon,
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
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.grey,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

// Ringkasan Bulan ini
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
