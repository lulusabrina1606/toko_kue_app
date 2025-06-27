import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreInfoScreen extends StatelessWidget {
  const StoreInfoScreen({super.key});

  // Fungsi buka Google Maps
  Future<void> _openGoogleMaps() async {
    const url =
        'https://maps.app.goo.gl/eYM423gbwiyPYqXN9'; // Link Google Maps toko
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka Google Maps';
    }
  }

  // Fungsi hubungi CS via WhatsApp
  Future<void> _hubungiCS() async {
    final Uri waUrl = Uri.parse(
      'https://wa.me/6282184581518?text=Halo%20Deluna%20Cake%2C%20saya%20ingin%20pesan%20kue',
    );
    if (await canLaunchUrl(waUrl)) {
      await launchUrl(waUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Toko'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/deluna_cakebg.png', // Ganti dengan foto toko kamu
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Deluna Cake',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Jl. Mawar No. 12, Medan\nTelp: 0821-XXXX-XXXX\nBuka setiap hari: 08.00 – 21.00',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              'Deluna Cake menyediakan beragam kue spesial untuk ulang tahun, pernikahan, dan berbagai acara lainnya. Kami juga menerima pesanan custom cake sesuai permintaan pelanggan.',
              style: TextStyle(fontSize: 15, decoration: TextDecoration.none),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.map),
                label: const Text('Lihat Lokasi di Google Maps'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: _openGoogleMaps,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.chat),
                label: const Text('Hubungi CS via WhatsApp'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: _hubungiCS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
