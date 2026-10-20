import 'package:flutter/material.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/pages/doa/doa_page.dart';
import 'package:ibadah_journey/pages/home/home_page.dart';
import 'package:ibadah_journey/pages/profile/profile_page.dart';
import 'package:ibadah_journey/pages/quran/quran_page.dart';
import 'package:ibadah_journey/pages/sholat/sholat_page.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // Mengecek apakah mode gelap aktif
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        // Jika menekan tab yang sedang aktif, tidak perlu navigasi ulang
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const QuranPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const SholatPage()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DoaPage()),
            );
            break;
          case 4:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ProfilePage()),
            );
            break;
        }
      },
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      // Menyesuaikan warna background dan unselected item berdasarkan mode
      backgroundColor: isDark ? const Color(0xff1E1E1E) : AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: isDark ? Colors.white38 : AppColors.grey,
      selectedIconTheme: const IconThemeData(
        size: 28,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Quran',
        ),
        BottomNavigationBarItem(
          // 🌟 Memperbaiki path gambar dan menambahkan efek warna dinamis (aktif/tidak aktif)
          icon: ImageIcon(
            const AssetImage(
                'assets/images/prayer.png'), // Sesuaikan path foldernya jika ada di 'assets/icons/prayer.png'
            size: 42.8,

            color: currentIndex == 2
                ? AppColors.primary
                : (isDark ? Colors.white38 : AppColors.grey),
          ),
          label: 'Panduan Ibadah Dan Sholat',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_rounded),
          label: 'Doa Harian',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person_rounded),
          label: 'Profil',
        ),
      ],
    );
  }
}
