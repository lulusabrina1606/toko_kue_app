import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/cart_provider.dart';
import 'screens/checkout_screen.dart';
import 'screens/order_history_screen.dart';
import 'providers/user_provider.dart';
import 'screens/profile_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/register_screen.dart';
import 'screens/login_screen.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/settings_screen.dart';
import '../screens/help_center_screen.dart';
import '../screens/store_info_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userProvider = UserProvider();
  await userProvider.loadUser(); // 🔁 load data tersimpan

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => userProvider),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        return MaterialApp(
          title: 'Toko Deluna Cake',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.pink),

          /// Tampilkan LoginScreen jika belum login (email kosong), jika sudah ada data email tampil HomeScreen
          home: userProvider.email.isEmpty ? const LoginScreen() : HomeScreen(),

          routes: {
            '/checkout': (context) => const CheckoutScreen(),
            '/order_history': (context) => OrderHistoryScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/cart': (context) => const CartScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => HomeScreen(),
            '/edit_profile': (context) => const EditProfileScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/help': (context) => const HelpCenterScreen(),
            '/store_info': (context) => const StoreInfoScreen(),
          },
        );
      },
    );
  }
}
