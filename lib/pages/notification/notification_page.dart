import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/pages/habit/habit_page.dart';
import 'package:ibadah_journey/pages/home/home_page.dart';
import 'package:ibadah_journey/pages/profile/profile_page.dart';
import 'package:ibadah_journey/pages/target/data/target_data.dart';
import 'package:ibadah_journey/pages/target/target_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final reminderTargets =
        targetList.where((target) => target.reminderEnabled).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text(
          'Pengingat Ibadah',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavbar(currentIndex: 1),
      body: reminderTargets.isEmpty
          ? const Center(
              child: Text(
                'Belum ada reminder aktif',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: reminderTargets.length,
              itemBuilder: (context, index) {
                final target = reminderTargets[index];

                final time =
                    '${target.reminderHour.toString().padLeft(2, '0')}:${target.reminderMinute.toString().padLeft(2, '0')}';

                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      /// ICON
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Icon(
                          target.icon,
                          color: AppColors.primary,
                          size: 28,
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// TEXT
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              target.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              time,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              target.activeDays.join(', '),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// TOGGLE
                      Switch(
                        value: target.reminderEnabled,
                        activeColor: AppColors.primary,
                        onChanged: (value) {
                          setState(() {
                            targetList[index] = target.copyWith(
                              reminderEnabled: value,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _BottomNavbar extends StatelessWidget {
  final int currentIndex;

  const _BottomNavbar({
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          /// HOME
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomePage(),
              ),
            );
            break;

          /// NITICATION
          case 1:
            break;

          /// Habit
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HabitPage(),
              ),
            );
            break;

          /// TARGET
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const TargetPage(),
              ),
            );
            break;

          /// PROFILE
          case 4:
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ProfilePage()));
            break;
        }
      },
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey,
      selectedIconTheme: const IconThemeData(
        size: 28,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.task_alt),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.track_changes_rounded),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: '',
        ),
      ],
    );
  }
}
