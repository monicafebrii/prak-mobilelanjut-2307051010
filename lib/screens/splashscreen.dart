import 'package:flutter/material.dart';
import 'dart:async'; // Import untuk menggunakan Timer/Future.delayed
import 'dashboard_screen.dart';
import 'login_screen.dart'; // Import untuk JustduitLogo

class SplashScreen extends StatefulWidget {
  // Nama rute untuk navigasi
  static const String route = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk navigasi setelah beberapa detik
    _navigateToDashboard();
  }

  // Fungsi untuk pindah ke Dashboard setelah delay
  void _navigateToDashboard() {
    // Tunggu selama 3 detik untuk menampilkan splash screen
    Future.delayed(const Duration(seconds: 5), () {
      // Gunakan pushReplacementNamed agar pengguna tidak bisa kembali ke splash screen
      Navigator.pushReplacementNamed(context, DashboardScreen.route);
    }); // Future.delayed
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    // Beri warna latar belakang yang sama dengan tema aplikasi
    backgroundColor: const Color(0xFFB8F8FB),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. Menggunakan kembali widget Logo yang sudah ada
          Image.asset(
  'assets/images/logo-mola.png',
  width: 120,
  height: 120,
),
          // 2. Indikator loading yang berputar
          const CircularProgressIndicator(
            color: Color(0xFF18E8FF), // Warna biru sesuai tema
          ), // CircularProgressIndicator
          const SizedBox(height: 16),

          // 3. Teks "Loading..."
          Text(
            'Loading Bersabar...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ), // TextStyle
          ), // Text
        ], // children
      ), // Column
    ), // Center
  ); // Scaffold
}
}