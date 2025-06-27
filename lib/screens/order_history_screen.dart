import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/colors.dart';
import '../widgets/order_detail_sheet.dart';
import '../providers/cart_provider.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data order dari provider
    final orders = context.watch<CartProvider>().orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        backgroundColor: AppColors.primary,
      ),
      body:
          orders.isEmpty
              ? Center(
                child: Text(
                  'Belum ada pesanan',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              )
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];

                  // Format tanggal supaya lebih readable, tambah pengecekan agar menit selalu 2 digit
                  final formattedDate =
                      '${order.date.day}/${order.date.month}/${order.date.year} ${order.date.hour}:${order.date.minute.toString().padLeft(2, '0')}';

                  return ListTile(
                    title: Text(
                      'Pesanan #${order.id}',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      formattedDate,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                    trailing: Text(
                      'Rp ${order.total.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      // Debugging: cek di console apakah fungsi onTap terpanggil
                      print('Pesanan #${order.id} ditekan');

                      // Tampilkan modal bottom sheet dengan detail order
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        builder: (_) => OrderDetailSheet(order: order),
                      );
                    },
                  );
                },
              ),
    );
  }
}
