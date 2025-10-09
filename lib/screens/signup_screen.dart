import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  static const route = '/signup';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  // Label wajib isi
  Widget requiredLabel(String text) => Row(
        children: [
          Text(text, style: const TextStyle(fontSize: 13)),
          const Text("*",
              style: TextStyle(color: Colors.red, fontSize: 13)),
        ],
      );

  // Tombol biru gradient
  Widget primaryButton(String label, VoidCallback onTap) => GestureDetector(
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
                      "Sign Up Now and Unlock the Power of Justchat!",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

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
                      requiredLabel("Full Name"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _name,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          hintText: "Enter your full name",
                        ),
                      ),
                      const SizedBox(height: 14),

                      requiredLabel("Email Address"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                        ),
                      ),
                      const SizedBox(height: 14),

                      requiredLabel("Password"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _pass,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Create a password",
                        ),
                      ),
                      const SizedBox(height: 14),

                      requiredLabel("Confirm Password"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _confirm,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Re-enter your password",
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Tombol Continue
                      primaryButton("Continue", () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Sign up success")),
                        );

                        // Setelah signup -> pindah ke login
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.route,
                          (route) => false,
                        );
                      }),
                      const SizedBox(height: 12),

                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.route);
                          },
                          child: const Text(
                            "Sign In",
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