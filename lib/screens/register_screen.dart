import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../theme/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final jenisKelaminController = TextEditingController();
    final tanggalLahirController = TextEditingController();
    final noHpController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            // Gambar Deluna Cake
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/deluna_cakebg.png',
                width: 160,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),

            _buildInputField(
              controller: nameController,
              icon: Icons.person,
              label: 'Nama',
            ),
            const SizedBox(height: 16),

            _buildInputField(
              controller: emailController,
              icon: Icons.email,
              label: 'Email',
            ),
            const SizedBox(height: 16),

            _buildInputField(
              controller: passwordController,
              icon: Icons.lock,
              label: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),

            _buildInputField(
              controller: jenisKelaminController,
              icon: Icons.wc,
              label: 'Jenis Kelamin',
            ),
            const SizedBox(height: 16),

            _buildInputField(
              controller: tanggalLahirController,
              icon: Icons.cake,
              label: 'Tanggal Lahir (YYYY-MM-DD)',
            ),
            const SizedBox(height: 16),

            _buildInputField(
              controller: noHpController,
              icon: Icons.phone,
              label: 'No. HP',
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final jenisKelamin = jenisKelaminController.text.trim();
                final tanggalLahir = tanggalLahirController.text.trim();
                final noHp = noHpController.text.trim();

                if ([
                  name,
                  email,
                  password,
                  jenisKelamin,
                  tanggalLahir,
                  noHp,
                ].any((e) => e.isEmpty)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Semua kolom wajib diisi')),
                  );
                  return;
                }

                final userProvider = Provider.of<UserProvider>(
                  context,
                  listen: false,
                );
                await userProvider.register(
                  name,
                  email,
                  password,
                  jenisKelamin,
                  tanggalLahir,
                  noHp,
                );

                Navigator.pushReplacementNamed(context, '/login');
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
                'Daftar',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Sudah punya akun? Login',
                style: GoogleFonts.poppins(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
