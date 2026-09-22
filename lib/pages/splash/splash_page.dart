import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ibadah_journey/core/constants/colors.dart';
import 'package:ibadah_journey/providers/prayer_provider.dart';
import 'package:ibadah_journey/pages/home/home_page.dart';

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

    // 2. Proses Pre-Fetching Data & Navigasi Otomatis
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Menunggu minimal 2.5 detik agar animasi splash terlihat halus oleh user
    final startTime = DateTime.now();

    try {
      // Sembari menunggu, kita bisa sekalian fetch data jadwal sholat awal di sini
      // sehingga saat masuk HomePage, data sudah siap dan tidak langsung memicu loading spinner
      await context.read<PrayerProvider>().fetchPrayerTimes();
    } catch (e) {
      debugPrint('Error fetch data saat splash: $e');
    }

    final elapsedTime = DateTime.now().difference(startTime);
    final remainingTime = const Duration(milliseconds: 2500) - elapsedTime;

    // Jika proses fetch selesai lebih cepat dari 2.5 detik, tahan sebentar sisa waktunya
    if (remainingTime > Duration.zero) {
      await Future.delayed(remainingTime);
    }

    // Pindah ke HomePage dan hapus SplashPage dari susunan stack navigasi
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
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
      backgroundColor: AppColors
          .primary, // Menggunakan warna utama (Hijau) sebagai background
      body: Stack(
        children: [
          // Pola hiasan/background samar jika ada (Opsional)
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/icons/mousqe.png', // Menggunakan aset masjid yang Anda miliki
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten Utama di Tengah
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo / Ikon Aplikasi
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
                      Icons
                          .mosque_rounded, // Menggunakan icon bawaan jika aset belum siap
                      size: 72,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nama Aplikasi
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

                  // Tagline
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

          // Loading Indikator di Bagian Bawah
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
