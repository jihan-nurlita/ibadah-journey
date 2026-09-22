import 'package:flutter/material.dart';
import 'package:ibadah_journey/models/hijri_day_model.dart';
import 'package:ibadah_journey/services/hijri_calendar_service.dart';
import 'package:intl/intl.dart';
import 'package:ibadah_journey/core/constants/colors.dart';

class HijriCalendarPage extends StatefulWidget {
  final Map<String, dynamic> prayerData;

  const HijriCalendarPage({
    super.key,
    required this.prayerData,
  });

  @override
  State<HijriCalendarPage> createState() => _HijriCalendarPageState();
}

class _HijriCalendarPageState extends State<HijriCalendarPage> {
  late DateTime _currentMonth;
  late int _selectedDay;

  List<HijriDayModel> monthData = [];

  final HijriCalendarService service = HijriCalendarService();

  Future<void> loadCalendar() async {
    try {
      final result = await service.getMonthCalendar(
        month: _currentMonth.month,
        year: _currentMonth.year,
      );

      monthData = result;

      if (_selectedDay > monthData.length) {
        _selectedDay = monthData.length;
      }

      if (!mounted) return;

      setState(() {});
    } catch (e) {
      debugPrint('ERROR API => $e');
    }
  }

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();

    _currentMonth = DateTime(
      now.year,
      now.month,
    );

    _selectedDay = now.day;

    loadCalendar();
  }

  void _nextMonth() async {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month + 1,
      );
    });

    await loadCalendar();
  }

  void _prevMonth() async {
    setState(() {
      _currentMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month - 1,
      );
    });

    await loadCalendar();
  }

  void _goToToday() async {
    final now = DateTime.now();

    setState(() {
      _currentMonth = DateTime(
        now.year,
        now.month,
      );

      _selectedDay = now.day;
    });

    await loadCalendar();
  }

  int _getFirstWeekday(int year, int month) {
    return DateTime(year, month, 1).weekday % 7;
  }

  String getIslamicEvent(
    int hijriDay,
    String hijriMonth,
  ) {
    /// RAMADHAN
    if (hijriMonth == 'Ramadan') {
      if (hijriDay == 1) {
        return 'Awal Ramadhan';
      }

      if (hijriDay >= 21 && hijriDay <= 29) {
        return '10 Malam Terakhir';
      }

      if (hijriDay == 27) {
        return 'Malam Lailatul Qadar';
      }
    }

    /// SYAWAL
    if (hijriMonth == 'Shawwal') {
      if (hijriDay == 1) {
        return 'Idul Fitri';
      }

      if (hijriDay >= 2 && hijriDay <= 7) {
        return 'Puasa Syawal';
      }
    }

    /// DZULHIJJAH
    if (hijriMonth == 'Dhul Hijjah') {
      if (hijriDay == 9) {
        return 'Puasa Arafah';
      }

      if (hijriDay == 10) {
        return 'Idul Adha';
      }

      if (hijriDay >= 11 && hijriDay <= 13) {
        return 'Hari Tasyrik';
      }
    }

    /// MUHARRAM
    if (hijriMonth == 'Muharram') {
      if (hijriDay == 1) {
        return 'Tahun Baru Islam';
      }

      if (hijriDay == 10) {
        return 'Puasa Asyura';
      }
    }

    /// RABIUL AWAL
    if (hijriMonth == 'Rabi\' al-Awwal') {
      if (hijriDay == 12) {
        return 'Maulid Nabi';
      }
    }

    /// RAJAB
    if (hijriMonth == 'Rajab') {
      if (hijriDay == 27) {
        return 'Isra Mi\'raj';
      }
    }

    /// UMUM
    if ([13, 14, 15].contains(hijriDay)) {
      return 'Puasa Ayyamul Bidh';
    }

    return 'Tidak ada event';
  }

  @override
  Widget build(BuildContext context) {
    /// LOADING
    if (monthData.isEmpty) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final selectedData =
        monthData[(_selectedDay - 1).clamp(0, monthData.length - 1)];

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

    final days = List.generate(
      monthData.length,
      (i) => i + 1,
    );

    final firstWeekday = _getFirstWeekday(
      _currentMonth.year,
      _currentMonth.month,
    );

    final eventName = getIslamicEvent(
      selectedData.hijriDay,
      selectedData.hijriMonth,
    );

    final hasEvent = eventName != 'Tidak ada event';

    final now = DateTime.now();

    return Scaffold(
      backgroundColor: AppColors.background,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        title: const Text(
          'Kalender Hijriah',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 20,
            letterSpacing: -0.3,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Material(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: _goToToday,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.today_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        child: Column(
          children: [
            /// =========================================================
            /// CARD KALENDER
            /// =========================================================
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  /// ===================================================
                  /// NAVIGASI BULAN
                  /// ===================================================
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavIconButton(
                          icon: Icons.chevron_left_rounded,
                          onTap: _prevMonth,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                DateFormat(
                                  'MMMM yyyy',
                                  'id_ID',
                                ).format(_currentMonth),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${selectedData.hijriMonth} ${selectedData.hijriYear} H',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _buildNavIconButton(
                          icon: Icons.chevron_right_rounded,
                          onTap: _nextMonth,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// ===================================================
                  /// HEADER HARI
                  /// ===================================================
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _DayHeader('Min'),
                      _DayHeader('Sen'),
                      _DayHeader('Sel'),
                      _DayHeader('Rab'),
                      _DayHeader('Kam'),
                      _DayHeader('Jum'),
                      _DayHeader('Sab'),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// ===================================================
                  /// GRID TANGGAL
                  /// ===================================================
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: days.length + firstWeekday,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      /// KOSONG SEBELUM TANGGAL 1
                      if (index < firstWeekday) {
                        return const SizedBox();
                      }

                      final day = days[index - firstWeekday];

                      final isSelected = _selectedDay == day;

                      final isToday = now.day == day &&
                          now.month == _currentMonth.month &&
                          now.year == _currentMonth.year;

                      Color? backgroundColor;

                      Color textColor = AppColors.black;

                      Color subTextColor = AppColors.grey;

                      /// TANGGAL DIPILIH
                      if (isSelected) {
                        backgroundColor = AppColors.primary;

                        textColor = Colors.white;

                        subTextColor = Colors.white.withOpacity(0.85);
                      }

                      /// HARI INI
                      else if (isToday) {
                        backgroundColor = AppColors.primary.withOpacity(0.10);

                        textColor = AppColors.primary;

                        subTextColor = AppColors.primary.withOpacity(0.8);
                      }

                      /// TANGGAL BIASA
                      else {
                        backgroundColor = AppColors.background;
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDay = day;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 200,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: backgroundColor,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : isToday
                                      ? AppColors.primary.withOpacity(0.35)
                                      : Colors.grey.shade200,
                              width: isSelected || isToday ? 1.2 : 1,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color:
                                          AppColors.primary.withOpacity(0.18),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// MASEHI
                              Text(
                                '$day',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: isSelected || isToday
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                  color: textColor,
                                ),
                              ),

                              const SizedBox(height: 1),

                              /// HIJRI
                              Text(
                                day <= monthData.length
                                    ? '${monthData[day - 1].hijriDay}'
                                    : '',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: isSelected || isToday
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                  color: subTextColor,
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

            const SizedBox(height: 18),

            /// =========================================================
            /// DETAIL CARD
            /// =========================================================
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ===================================================
                  /// TANGGAL + BADGE EVENT
                  /// ===================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${selectedData.hijriDay} '
                              '${selectedData.hijriMonth} '
                              '${selectedData.hijriYear} H',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: AppColors.black,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              readableDate,
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (hasEvent) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.2),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.stars_rounded,
                                color: AppColors.primary,
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Event Islam',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 16),

                  Divider(
                    height: 1,
                    color: Colors.grey.shade200,
                  ),

                  const SizedBox(height: 16),

                  /// ===================================================
                  /// EVENT TILE
                  /// ===================================================
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: hasEvent
                          ? AppColors.secondary.withOpacity(0.35)
                          : AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: hasEvent
                            ? AppColors.primary.withOpacity(0.15)
                            : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: [
                        /// ICON
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color:
                                hasEvent ? AppColors.primary : AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: (hasEvent
                                        ? AppColors.primary
                                        : Colors.black)
                                    .withOpacity(0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            hasEvent
                                ? Icons.event_available_rounded
                                : Icons.calendar_today_rounded,
                            color:
                                hasEvent ? AppColors.white : AppColors.primary,
                            size: 24,
                          ),
                        ),

                        const SizedBox(width: 14),

                        /// TEXT EVENT
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                eventName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                hasEvent
                                    ? 'Momen penting dalam kalender Islam'
                                    : 'Tidak ada agenda khusus hari ini',
                                style: const TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 12,
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
          ],
        ),
      ),
    );
  }

  /// ===============================================================
  /// BUTTON NAVIGASI BULAN
  /// ===============================================================
  Widget _buildNavIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade200,
            ),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
      ),
    );
  }
}

/// ===============================================================
/// HEADER HARI
/// ===============================================================
class _DayHeader extends StatelessWidget {
  final String text;

  const _DayHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
