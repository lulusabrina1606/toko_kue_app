import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nama Lengkap',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(userProvider.nama.isNotEmpty ? userProvider.nama : '-'),
              const SizedBox(height: 12),
              Text(
                'Email',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(userProvider.email.isNotEmpty ? userProvider.email : '-'),
              const SizedBox(height: 12),
              Text(
                'Jenis Kelamin',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(
                userProvider.jenisKelamin.isNotEmpty
                    ? userProvider.jenisKelamin
                    : '-',
              ),
              const SizedBox(height: 12),
              Text(
                'Tanggal Lahir',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(
                userProvider.tanggalLahir.isNotEmpty
                    ? userProvider.tanggalLahir
                    : '-',
              ),
              const SizedBox(height: 12),
              Text(
                'No. HP',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              ),
              Text(userProvider.noHp.isNotEmpty ? userProvider.noHp : '-'),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit_profile');
                  },
                  child: Text('Edit Profil'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
