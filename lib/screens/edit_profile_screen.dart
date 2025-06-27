import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../theme/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jenisKelaminController = TextEditingController();
  final TextEditingController _tanggalLahirController = TextEditingController();
  final TextEditingController _noHpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false);
    _namaController.text = user.nama;
    _emailController.text = user.email;
    _jenisKelaminController.text = user.jenisKelamin;
    _tanggalLahirController.text = user.tanggalLahir;
    _noHpController.text = user.noHp;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildInput('Nama', Icons.person, _namaController),
            const SizedBox(height: 16),
            _buildInput('Email', Icons.email, _emailController),
            const SizedBox(height: 16),
            _buildInput(
              'Jenis Kelamin',
              Icons.transgender,
              _jenisKelaminController,
            ),
            const SizedBox(height: 16),
            _buildInput(
              'Tanggal Lahir',
              Icons.calendar_today,
              _tanggalLahirController,
            ),
            const SizedBox(height: 16),
            _buildInput('No. HP', Icons.phone, _noHpController),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                await userProvider.setNama(_namaController.text.trim());
                await userProvider.setEmail(_emailController.text.trim());
                await userProvider.setJenisKelamin(
                  _jenisKelaminController.text.trim(),
                );
                await userProvider.setTanggalLahir(
                  _tanggalLahirController.text.trim(),
                );
                await userProvider.setNoHp(_noHpController.text.trim());

                if (!mounted) return;
                Navigator.pop(context);
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
                'Simpan',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
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
