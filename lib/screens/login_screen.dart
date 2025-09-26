import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'dashboard_screen.dart'; // pastikan import ini ada

class LoginScreen extends StatefulWidget {
  static const route = '/signin';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Widget untuk label dengan tanda bintang
  Widget requiredLabel(String label) => Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 13)),
          const Text("*", style: TextStyle(color: Colors.red, fontSize: 13)),
        ],
      );

  // Tombol biru gradient
  Widget primaryButton({required String label, required VoidCallback onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFF1E88E5), Color(0xFF207DFF)],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF1E88E5),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/logo-mola.png',
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 18),

                // Judul
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hi, Welcome Back to Justchat!",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Card Form
                Container(
                  width: 360,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      requiredLabel("Email Address"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                        ),
                      ),
                      const SizedBox(height: 14),

                      requiredLabel("Password"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                        ),
                      ),
                      const SizedBox(height: 8),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Tombol Sign In Now (Sesuai Gambar)
                      primaryButton(
                        label: 'Sign In Now',
                        onTap: () {
                          // Cek apakah email atau password kosong
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            // Jika ya, tampilkan notifikasi error
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Email dan Password tidak boleh kosong!'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            // Jika tidak, lanjutkan ke dashboard
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              DashboardScreen.route,
                              (route) => false,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 14),

                      // Tombol Create Account
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, SignupScreen.route);
                          },
                          child: const Text(
                            "Create New Account",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}