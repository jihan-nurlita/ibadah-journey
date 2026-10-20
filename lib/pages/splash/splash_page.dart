import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/providers/prayer_provider.dart';
import 'package:ibadah_journey/pages/home/home_page.dart';
import 'package:ibadah_journey/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Inisialisasi Animasi Fade-in untuk Logo
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();

    // 2. Proses Pre-Fetching Data & Pengecekan Auth
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final startTime = DateTime.now();

    bool isLoggedIn = false;

    try {
      // 🌟 3. Cek status login dari SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      isLoggedIn = prefs.getBool('is_logged_in') ?? false;

      // Sembari menunggu, fetch data jadwal sholat awal
      await context.read<PrayerProvider>().fetchPrayerTimes();
    } catch (e) {
      debugPrint('Error fetch data saat splash: $e');
    }

    final elapsedTime = DateTime.now().difference(startTime);
    final remainingTime = const Duration(milliseconds: 2500) - elapsedTime;

    // Tahan sebentar sisa waktu jika animasi kurang dari 2.5 detik
    if (remainingTime > Duration.zero) {
      await Future.delayed(remainingTime);
    }

    // 🌟 4. Arahkan dinamis berdasarkan status login
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => isLoggedIn ? const HomePage() : const LoginPage(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/icons/mousqe.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      size: 72,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Ibadah Journey',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Teman Setia Langkah Hijrahmu',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Menyiapkan data waktu sholat...',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
