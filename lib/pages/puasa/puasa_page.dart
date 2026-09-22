import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ibadah_journey/core/constants/colors.dart';

class PuasaPage extends StatefulWidget {
  const PuasaPage({super.key});

  @override
  State<PuasaPage> createState() => _PuasaPageState();
}

class _PuasaPageState extends State<PuasaPage> {
  final List<int> fastingDays = [
    1,
    10,
    13,
    14,
    15,
    27,
  ];

  final List<Map<String, dynamic>> fastingList = [
    {
      'title': 'Puasa Senin Kamis',
      'subtitle': 'Setiap hari Senin & Kamis',
      'icon': Icons.calendar_today_rounded,
    },
    {
      'title': 'Puasa Ayyamul Bidh',
      'subtitle': '13 • 14 • 15 Hijriyah',
      'icon': Icons.dark_mode_rounded,
    },
    {
      'title': 'Puasa Asyura',
      'subtitle': '10 Muharram',
      'icon': Icons.star_rounded,
    },
    {
      'title': 'Puasa Arafah',
      'subtitle': '9 Dzulhijjah',
      'icon': Icons.mosque_rounded,
    },
    {
      'title': 'Puasa Syawal',
      'subtitle': '6 Hari di Bulan Syawal',
      'icon': Icons.auto_awesome_rounded,
    },
  ];

  late DateTime currentMonth;

  int selectedDay = DateTime.now().day;

  @override
  void initState() {
    super.initState();

    currentMonth = DateTime.now();
  }

  void nextMonth() {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month + 1,
      );
    });
  }

  void prevMonth() {
    setState(() {
      currentMonth = DateTime(
        currentMonth.year,
        currentMonth.month - 1,
      );
    });
  }

  List<int> generateDays(int year, int month) {
    final lastDay = DateTime(year, month + 1, 0).day;

    return List.generate(lastDay, (i) => i + 1);
  }

  int firstWeekday(int year, int month) {
    return DateTime(year, month, 1).weekday % 7;
  }

  bool isFastingDay(int day) {
    return fastingDays.contains(day);
  }

  @override
  Widget build(BuildContext context) {
    final days = generateDays(
      currentMonth.year,
      currentMonth.month,
    );

    final firstDay = firstWeekday(
      currentMonth.year,
      currentMonth.month,
    );

    final readableMonth = DateFormat(
      'MMMM yyyy',
      'id_ID',
    ).format(currentMonth);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
        title: const Text(
          'Puasa Sunnah',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4A9B78),
                    Color(0xff2E7D5A),
                  ],
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.dark_mode_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Puasa Berikutnya',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Senin, 8 Juni',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '12 Jam 21 Menit Lagi',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// TARGET
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
                    'Target Puasa Bulan Ini',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: 0.7,
                      minHeight: 14,
                      backgroundColor: AppColors.secondary,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    '7 / 10 Hari Tercapai',
                    style: TextStyle(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// CALENDAR
            Container(
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
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: prevMonth,
                        icon: const Icon(
                          Icons.chevron_left,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          readableMonth,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: nextMonth,
                        icon: const Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DayText('Min'),
                      _DayText('Sen'),
                      _DayText('Sel'),
                      _DayText('Rab'),
                      _DayText('Kam'),
                      _DayText('Jum'),
                      _DayText('Sab'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: days.length + firstDay,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      if (index < firstDay) {
                        return const SizedBox();
                      }

                      final day = days[index - firstDay];

                      final isSelected = selectedDay == day;

                      final isFasting = isFastingDay(day);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.secondary
                                : isFasting
                                    ? const Color(
                                        0xffE8FFF1,
                                      )
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : isFasting
                                      ? AppColors.primary
                                      : Colors.grey.shade200,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                '$day',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? AppColors.primary
                                      : AppColors.black,
                                ),
                              ),
                              if (isFasting)
                                Positioned(
                                  bottom: 6,
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// LIST PUASA
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
                    'Puasa Sunnah',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...fastingList.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 14,
                      ),
                      child: _FastingTile(
                        icon: item['icon'] as IconData,
                        title: item['title'] as String,
                        subtitle: item['subtitle'] as String,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// NIAT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff4A9B78),
                    Color(0xff2E7D5A),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Niat Puasa',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'نَوَيْتُ صَوْمَ غَدٍ عَنْ أَدَاءِ سُنَّةِ الاِثْنَيْنِ لِلّٰهِ تَعَالَى',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.8,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Aku berniat puasa sunnah hari Senin karena Allah Ta’ala.',
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _DayText extends StatelessWidget {
  final String text;

  const _DayText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      ),
    );
  }
}

class _FastingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FastingTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
