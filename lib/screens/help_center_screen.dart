import 'package:flutter/material.dart';
import '../theme/colors.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pusat Bantuan'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'FAQ - Pertanyaan yang Sering Diajukan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 16),

            ExpansionTile(
              title: const Text('Bagaimana cara memesan kue?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Pilih kue favorit Anda di halaman utama, kemudian tambahkan ke keranjang dan lakukan pembayaran pada halaman checkout.',
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: const Text('Metode pembayaran apa saja yang tersedia?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Kami menerima pembayaran via transfer bank, e-wallet, dan kartu kredit.',
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: const Text('Apakah ada layanan antar ke rumah?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ya, kami menyediakan layanan antar ke rumah dengan biaya pengiriman sesuai jarak.',
                  ),
                ),
              ],
            ),

            ExpansionTile(
              title: const Text('Bagaimana cara menghubungi customer service?'),
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Anda bisa menghubungi CS melalui menu Pengaturan > Hubungi CS (WhatsApp) atau langsung melalui nomor yang tersedia di website kami.',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
