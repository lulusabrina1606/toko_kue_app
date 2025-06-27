import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cake.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CakeDetailScreen extends StatelessWidget {
  final Cake cake;
  const CakeDetailScreen({super.key, required this.cake});

  @override
  Widget build(BuildContext context) {
    // PASTIKAN import provider sudah ada
    final cart = Provider.of<CartProvider>(context, listen: false);

    final formattedPrice = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(cake.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Cake'),
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500, // Biar gak terlalu melebar di laptop besar
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Lebar isi minimal sesuai konten
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(cake.image, height: 200),
                const SizedBox(height: 16),
                Text(
                  cake.name,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  formattedPrice,
                  style: GoogleFonts.poppins(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  cake.description,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    print('Tombol ditekan, cake: ${cake.name}');
                    cart.addToCart(cake);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ditambahkan ke keranjang')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Tambahkan ke Keranjang',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Keranjang',
                    style: GoogleFonts.poppins(
                      color: AppColors.accent,
                      fontSize: 16,
                    ),
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
