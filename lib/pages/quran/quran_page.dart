import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/pages/doa/doa_page.dart';
import 'package:ibadah_journey/pages/habit/habit_page.dart';
import 'package:ibadah_journey/pages/home/home_page.dart';
import 'package:ibadah_journey/pages/profile/profile_page.dart';

import 'package:ibadah_journey/pages/quran/detail_surah_page.dart';
import 'package:ibadah_journey/pages/quran/surah.dart';
import 'package:ibadah_journey/pages/quran/tabs/bookmark_tab.dart';
import 'package:ibadah_journey/pages/quran/tabs/juz_tab.dart';
import 'package:ibadah_journey/services/quran_service.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List<Surah> surahList = [];

  List<Surah> filteredSurah = [];

  @override
  void initState() {
    super.initState();

    loadSurah();
  }

  void loadSurah() async {
    final data = await QuranService.getAllSurah();

    setState(() {
      surahList = data;

      filteredSurah = data;
    });
  }

  void searchSurah(String keyword) {
    final results = surahList.where((surah) {
      return surah.namaLatin.toLowerCase().contains(
            keyword.toLowerCase(),
          );
    }).toList();

    setState(() {
      filteredSurah = results;
    });
  }

  // CATEGORY
  String selectedCategory = "Surah";

  final List<String> categories = [
    "Surah",
    "Juz",
    "Bookmark",
  ];

  @override
  Widget build(BuildContext context) {
    if (surahList.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: const _BottomNavbar(currentIndex: 2),
      appBar: AppBar(
        title: const Text(
          "Al-Qur'an",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            /// SEARCH
            TextField(
              onChanged: searchSurah,
              decoration: InputDecoration(
                hintText: "Cari Surah",
                prefixIcon: UnconstrainedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Image.asset(
                      'assets/images/search.png',
                      color: AppColors.primary,
                      width: 18, // Atur ukuran ikon di sini
                      height: 18,
                    ),
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// CATEGORY
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  final isSelected = selectedCategory == category;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// LIST SURAH

            Expanded(
              child: Builder(
                builder: (_) {
                  if (selectedCategory == "Surah") {
                    return ListView.builder(
                      itemCount: filteredSurah.length,
                      itemBuilder: (context, index) {
                        final surah = filteredSurah[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailSurahPage(
                                  noSurat: surah.nomor,
                                ),
                              ),
                            );
                          },
                          child: SurahTile(
                            surahName: surah.namaLatin,
                            surahNumber: surah.nomor.toString(),
                            totalAyah: "${surah.jumlahAyat} Ayat",
                          ),
                        );
                      },
                    );
                  }

                  /// JUZ
                  if (selectedCategory == "Juz") {
                    return JuzTab(
                      allSurah: surahList,
                    );
                  }

                  /// BOOKMARK
                  return BookmarkTab(
                    allSurah: surahList,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SurahTile extends StatelessWidget {
  final String surahName;
  final String surahNumber;
  final String totalAyah;

  const SurahTile({
    super.key,
    required this.surahName,
    required this.surahNumber,
    required this.totalAyah,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                surahNumber,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surahName,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  totalAyah,
                  style: const TextStyle(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
        ],
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

          /// HABIT
          case 1:
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HabitPage()));
            break;

          /// QURAN
          case 2:
            break;

          /// DOA
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const DoaPage(),
              ),
            );
            break;

          /// PROFILE
          case 4:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const ProfilePage()));
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
          icon: Icon(Icons.calendar_month_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.nightlight_round),
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
