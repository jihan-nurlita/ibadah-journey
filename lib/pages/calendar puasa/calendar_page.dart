import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ibadah_journey/core/constants/colors.dart';

class CalendarPage extends StatefulWidget {
  final Map<String, dynamic> prayerData;

  const CalendarPage({
    super.key,
    required this.prayerData,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _currentMonth;
  late int _selectedDay;

  final List<String> hijriMonths = [
    'Muharram',
    'Safar',
    'Rabiul Awal',
    'Rabiul Akhir',
    'Jumadil Awal',
    'Jumadil Akhir',
    'Rajab',
    'Sya’ban',
    'Ramadhan',
    'Syawal',
    'Dzulqa’dah',
    'Dzulhijjah',
  ];

  @override
  void initState() {
    super.initState();

    final gregorian =
        widget.prayerData['date']['gregorian'] as Map<String, dynamic>;

    final rawDate = gregorian['date'];

    final parsedDate = DateFormat('dd-MM-yyyy').parse(rawDate);

    _currentMonth = DateTime(parsedDate.year, parsedDate.month);

    _selectedDay = parsedDate.day;
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month + 1,
      );
    });
  }

  void _prevMonth() {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month - 1,
      );
    });
  }

  List<int> _generateDays(int year, int month) {
    final lastDay = DateTime(year, month + 1, 0).day;

    return List.generate(lastDay, (i) => i + 1);
  }

  int _getFirstWeekday(int year, int month) {
    return DateTime(year, month, 1).weekday % 7;
  }

  List<int> getFastingDays() {
    return [
      1,
      10,
      13,
      14,
      15,
      27,
    ];
  }

  bool isFastingDay(int day) {
    return getFastingDays().contains(day);
  }

  String getIslamicEvent(int day) {
    final events = {
      1: 'Puasa Awal Bulan Hijriyah',
      10: 'Puasa Sunnah',
      13: 'Puasa Ayyamul Bidh',
      14: 'Puasa Ayyamul Bidh',
      15: 'Puasa Ayyamul Bidh',
      27: 'Malam Istimewa',
    };

    return events[day] ?? 'Tidak ada event';
  }

  Color getDayColor({
    required bool isSelected,
    required bool isToday,
    required bool hasEvent,
  }) {
    if (isSelected) {
      return AppColors.secondary;
    }

    if (hasEvent) {
      return const Color(0xffE8FFF1);
    }

    if (isToday) {
      return AppColors.primary.withOpacity(0.08);
    }

    return AppColors.white;
  }

  @override
  Widget build(BuildContext context) {
    final hijri = widget.prayerData['date']['hijri'] as Map<String, dynamic>;

    final readableDate = DateFormat(
      'EEEE, d MMMM yyyy',
      'id_ID',
    ).format(
      DateTime(
        _currentMonth.year,
        _currentMonth.month,
        _selectedDay,
      ),
    );

    final days = _generateDays(
      _currentMonth.year,
      _currentMonth.month,
    );

    final firstWeekday = _getFirstWeekday(
      _currentMonth.year,
      _currentMonth.month,
    );

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
          'Kalender Hijriah',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: GestureDetector(
              onTap: () {
                final now = DateTime.now();

                setState(() {
                  _currentMonth = DateTime(
                    now.year,
                    now.month,
                  );

                  _selectedDay = now.day;
                });
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.today_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            /// HEADER CARD
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
              child: Column(
                children: [
                  const Icon(
                    Icons.mosque_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '${hijriMonths[_currentMonth.month - 1]} ${hijri['year']} H',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    readableDate,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// CALENDAR CARD
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
                  /// HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed: _prevMonth,
                        icon: const Icon(Icons.chevron_left),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              DateFormat(
                                'MMMM yyyy',
                                'id_ID',
                              ).format(_currentMonth),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${hijriMonths[_currentMonth.month - 1]} ${hijri['year']} H',
                              style: const TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: _nextMonth,
                        icon: const Icon(Icons.chevron_right),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  /// WEEK TEXT
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

                  /// GRID
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: days.length + firstWeekday,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      if (index < firstWeekday) {
                        return const SizedBox();
                      }

                      final day = days[index - firstWeekday];

                      final isSelected = _selectedDay == day;

                      final now = DateTime.now();

                      final isToday = day == now.day &&
                          _currentMonth.month == now.month &&
                          _currentMonth.year == now.year;

                      final hasEvent = isFastingDay(day);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                          decoration: BoxDecoration(
                            color: getDayColor(
                              isSelected: isSelected,
                              isToday: isToday,
                              hasEvent: hasEvent,
                            ),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : hasEvent
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
                              if (hasEvent)
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

            /// DETAIL EVENT
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
                  Text(
                    '$_selectedDay ${hijri['month']['en']} ${hijri['year']} H',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    readableDate,
                    style: const TextStyle(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: Icon(
                            isFastingDay(_selectedDay)
                                ? Icons.dark_mode_rounded
                                : Icons.auto_awesome,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isFastingDay(_selectedDay)
                                    ? 'Puasa Sunnah'
                                    : 'Event Islam',
                                style: const TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                getIslamicEvent(
                                  _selectedDay,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
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

            const SizedBox(height: 24),

            /// PUASA LIST
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
                    'Jadwal Puasa Sunnah',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _eventTile(
                    icon: Icons.dark_mode_rounded,
                    title: 'Puasa Ayyamul Bidh',
                    subtitle: '13 • 14 • 15 Hijriyah',
                  ),
                  const SizedBox(height: 14),
                  _eventTile(
                    icon: Icons.star_rounded,
                    title: 'Puasa Sunnah',
                    subtitle: '10 Hijriyah',
                  ),
                  const SizedBox(height: 14),
                  _eventTile(
                    icon: Icons.mosque_rounded,
                    title: 'Awal Bulan Hijriyah',
                    subtitle: '1 Hijriyah',
                  ),
                  const SizedBox(height: 14),
                  _eventTile(
                    icon: Icons.nightlight_round,
                    title: 'Malam Istimewa',
                    subtitle: '27 Hijriyah',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// QUOTE
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
                    'Quote Islami',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '"Sesungguhnya bilangan bulan di sisi Allah adalah dua belas bulan."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'QS. At-Taubah : 36',
                    style: TextStyle(
                      color: Colors.white70,
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

Widget _eventTile({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      children: [
        Container(
          width: 52,
          height: 52,
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
              const SizedBox(height: 4),
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
