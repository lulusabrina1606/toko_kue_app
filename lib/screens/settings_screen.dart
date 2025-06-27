import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  // Fungsi untuk membuka lokasi toko di Google Maps
  Future<void> bukaLokasiToko() async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/place/Toko+Kue+Deluna',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Kalau gagal, tampilkan pesan error atau snackbar
      throw 'Tidak bisa membuka Google Maps';
    }
  }

  // Fungsi untuk menghubungi CS lewat WhatsApp
  Future<void> hubungiCS() async {
    final Uri waUrl = Uri.parse(
      'https://wa.me/6281234567890?text=Halo%20Deluna%20Cake%2C%20saya%20ingin%20pesan%20kue',
    );
    if (await canLaunchUrl(waUrl)) {
      await launchUrl(waUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil Saya'),
            subtitle: Text(userProvider.nama),
            onTap: () {
              Navigator.pushNamed(context, '/edit_profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.store),
            title: const Text('Profil Toko'),
            onTap: () {
              Navigator.pushNamed(context, '/store_info');
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Lokasi Toko'),
            onTap: () async {
              try {
                await bukaLokasiToko();
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Hubungi CS (WhatsApp)'),
            onTap: () async {
              try {
                await hubungiCS();
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang Aplikasi'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'Deluna Cake',
                applicationVersion: '1.0.0',
                children: const [
                  Text('Aplikasi pemesanan kue sederhana dengan Flutter.'),
                ],
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Pusat Bantuan'),
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              userProvider.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
