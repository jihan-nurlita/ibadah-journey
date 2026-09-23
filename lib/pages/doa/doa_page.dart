import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/pages/doa/detail_doa_page.dart';
import 'package:ibadah_journey/pages/habit/habit_page.dart';
import 'package:ibadah_journey/pages/home/home_page.dart';
import 'package:ibadah_journey/pages/profile/profile_page.dart';
import 'package:ibadah_journey/pages/quran/quran_page.dart';
import 'doa_data.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  State<DoaPage> createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  List<DoaModel> filteredDoa = [];

  String selectedCategory = "Semua";

  final List<String> categories = [
    "Semua",
    "Shalawat",
    "Dzikir Pagi",
    "Dzikir Petang",
  ];

  @override
  void initState() {
    super.initState();
    filteredDoa = doaList;
  }

  // ============================================================
  // SEARCH DOA
  // ============================================================

  void searchDoa(String keyword) {
    final result = doaList.where((doa) {
      final matchKeyword = doa.judul.toLowerCase().contains(
            keyword.toLowerCase(),
          );

      final matchCategory = selectedCategory == "Semua"
          ? true
          : doa.kategori.contains(
              selectedCategory,
            );

      return matchKeyword && matchCategory;
    }).toList();

    setState(() {
      filteredDoa = result;
    });
  }

  // ============================================================
  // FILTER CATEGORY
  // ============================================================

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;

      if (category == "Semua") {
        filteredDoa = doaList;
      } else {
        filteredDoa = doaList
            .where(
              (e) => e.kategori.contains(category),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomNavbar(
        currentIndex: 3,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Doa Harian",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            /// SEARCH
            TextField(
              onChanged: searchDoa,
              decoration: InputDecoration(
                hintText: "Cari doa & dzikir harian...",
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

            const SizedBox(height: 16),

            /// CATEGORY
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isActive = selectedCategory == cat;

                  return GestureDetector(
                    onTap: () => filterByCategory(cat),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isActive ? AppColors.primary : AppColors.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          color: isActive ? Colors.white : AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// LIST DOA
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoa.length,
                itemBuilder: (context, index) {
                  final doa = filteredDoa[index];

                  return DoaTile(
                    number: "${index + 1}",
                    title: doa.judul,
                    doa: doa,
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

class DoaTile extends StatelessWidget {
  final String number;
  final String title;
  final DoaModel doa;

  const DoaTile({
    super.key,
    required this.number,
    required this.title,
    required this.doa,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailPage(doa: doa),
          ),
        );
      },
      child: Container(
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
                  number,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
          ],
        ),
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const QuranPage(),
              ),
            );
            break;

          /// DOA
          case 3:
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
