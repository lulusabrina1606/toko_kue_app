import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),

            /// 🔁 Gambar logo Deluna
            Image.asset('assets/deluna_cakebg.png', height: 200),

            const SizedBox(height: 25),

            /// 📧 Input Email
            _buildInputField(
              controller: emailController,
              icon: Icons.email,
              label: 'Email',
            ),

            const SizedBox(height: 16),

            /// 🔒 Input Password
            _buildInputField(
              controller: passwordController,
              icon: Icons.lock,
              label: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 24),

            /// 🔘 Tombol Login
            ElevatedButton(
              onPressed: () async {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email dan password wajib diisi'),
                    ),
                  );
                  return;
                }

                final userProvider = Provider.of<UserProvider>(
                  context,
                  listen: false,
                );
                final success = await userProvider.login(email, password);

                if (success) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email atau password salah')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 16),

            /// 🔗 Navigasi ke Register
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                'Belum punya akun? Daftar',
                style: GoogleFonts.poppins(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔧 Input Field Builder
  Widget _buildInputField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: AppColors.primary),
          hintText: label,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
        style: GoogleFonts.poppins(),
      ),
    );
  }
}
