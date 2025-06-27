import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cake.dart';
import '../theme/colors.dart';
import 'cake_detail_screen.dart';
import 'cart_screen.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Cake> cakes = [
    Cake(
      id: '1',
      name: 'Strawberry Cake',
      image: 'assets/stoberry_cake.jpeg',
      price: 30000,
      description:
          'Kue lembut dengan rasa strawberry segar dan topping buah asli.',
      rating: 4.8,
      isBestSeller: true,
    ),
    Cake(
      id: '2',
      name: 'Chocolate Cake',
      image: 'assets/cake_chocolate.jpeg',
      price: 40000,
      description:
          'Kue coklat moist dengan lapisan ganache yang meleleh di mulut.',
      rating: 4.7,
      isBestSeller: false,
    ),
    Cake(
      id: '3',
      name: 'Matcha Roll',
      image: 'assets/macha_roll.jpg',
      price: 50000,
      description:
          'Bolu gulung dengan aroma matcha Jepang yang khas dan isian krim.',
      rating: 4.7,
      isBestSeller: false,
    ),
    Cake(
      id: '4',
      name: 'Cheesecake',
      image: 'assets/cake_cheese.jpeg',
      price: 60000,
      description: 'Cheesecake lembut dengan toping strawberry yang manis.',
      rating: 4.8,
      isBestSeller: true,
    ),
    Cake(
      id: '5',
      name: 'Pandan cake',
      image: 'assets/cake_pandan.jpg',
      price: 65000,
      description: 'Kue pandan lembut dengan aroma harum daun pandan asli.',
      rating: 4.7,
      isBestSeller: false,
    ),
    Cake(
      id: '6',
      name: 'Vanila cake',
      image: 'assets/vanila_cake.jpeg',
      price: 55000,
      description: 'Kue vanila klasik dengan tekstur lembut dan aroma manis.',
      rating: 4.6,
      isBestSeller: false,
    ),
    Cake(
      id: '7',
      name: 'Rainbow cake',
      image: 'assets/rainbow_cake.png',
      price: 55000,
      description:
          'Rainbow Cake lembut dengan lapisan warna-warni dan krim melimpah, manisnya bikin jatuh cinta di gigitan pertama!',
      rating: 4.9,
      isBestSeller: true,
    ),
    Cake(
      id: '8',
      name: 'Oreo cake',
      image: 'assets/oreo_cake.jpeg',
      price: 45000,
      description:
          'Oreo Cake lembut dengan taburan remah Oreo dan krim melimpah, manis gurihnya nyatu sempurna di setiap gigitan',
      rating: 4.8,
      isBestSeller: false,
    ),
    Cake(
      id: '9',
      name: 'Manggo cake',
      image: 'assets/mangga_cake.jpeg',
      price: 90000,
      description:
          'Mangga Cake segar dengan lapisan krim lembut dan potongan mangga asli, manis asamnya bikin nagih terus!',
      rating: 4.8,
      isBestSeller: false,
    ),
    Cake(
      id: '10',
      name: 'Unicorn cake',
      image: 'assets/unicron.png',
      price: 75000,
      description:
          'Unicorn Cake cantik dengan warna pastel ceria dan krim melimpah, manisnya seajaib tampilannya',
      rating: 4.8,
      isBestSeller: false,
    ),
    Cake(
      id: '11',
      name: 'Galaksy cake',
      image: 'assets/galaksi.png',
      price: 98000,
      description:
          'Galaksi Cake dengan warna-warna kosmik dan krim berkilau, rasa manisnya bikin terbang ke luar angkasa!',
      rating: 4.9,
      isBestSeller: true,
    ),
    Cake(
      id: '12',
      name: 'Choco velvet cake',
      image: 'assets/choco_velvet.png',
      price: 75000,
      description:
          'Choco Velvet Cake lembut dengan paduan cokelat premium dan krim halus, lumer manisnya bikin susah berhenti!',
      rating: 4.8,
      isBestSeller: false,
    ),
    Cake(
      id: '13',
      name: 'Blackforest cake',
      image: 'assets/blackforest.png',
      price: 100000,
      description:
          'Unicorn Cake cantik dengan warna pastel ceria dan krim melimpah, manisnya seajaib tampilannya',
      rating: 4.8,
      isBestSeller: false,
    ),
    Cake(
      id: '14',
      name: 'Butter cake',
      image: 'assets/bater.jpg',
      price: 75000,
      description:
          'Butter Cake klasik dengan aroma mentega yang harum dan tekstur super lembut, manisnya pas di setiap gigitan!',
      rating: 4.8,
      isBestSeller: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Deluna Cake',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Profil',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'Riwayat') {
                Navigator.pushNamed(context, '/orders');
              } else if (value == 'Keranjang') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              } else if (value == 'Pengaturan') {
                Navigator.pushNamed(context, '/settings');
              } else if (value == 'Logout') {
                userProvider.logout();
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            itemBuilder:
                (context) => const [
                  PopupMenuItem(
                    value: 'Riwayat',
                    child: Text('Riwayat Pesanan'),
                  ),
                  PopupMenuItem(value: 'Keranjang', child: Text('Keranjang')),
                  PopupMenuItem(value: 'Pengaturan', child: Text('Pengaturan')),
                  PopupMenuDivider(),
                  PopupMenuItem(value: 'Logout', child: Text('Logout')),
                ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<UserProvider>(
              builder:
                  (context, user, child) => Text(
                    'Selamat datang, ${user.nama}!',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: cakes.length,
                itemBuilder: (context, index) {
                  final cake = cakes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CakeDetailScreen(cake: cake),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;

                            var tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    cake.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                if (cake.isBestSeller)
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'Best Seller',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  cake.name,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Rp ${cake.price.toStringAsFixed(0)}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      cake.rating.toString(),
                                      style: GoogleFonts.poppins(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
