import 'package:flutter/material.dart';
import '../models/order.dart';
import '../theme/colors.dart';

class OrderDetailSheet extends StatelessWidget {
  final Order order;

  const OrderDetailSheet({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Struk Pesanan #${order.id}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tanggal: ${order.date.toLocal()}',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const Divider(height: 24),
            // List detail tiap cake yang dipesan
            ...order.items.map(
              (orderItem) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Image.asset(
                  orderItem.cake.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(orderItem.cake.name),
                subtitle: Text(
                  'Rp ${orderItem.cake.price.toStringAsFixed(0)} x ${orderItem.quantity}',
                ),
                trailing: Text(
                  'Rp ${(orderItem.cake.price * orderItem.quantity).toStringAsFixed(0)}',
                ),
              ),
            ),
            const Divider(height: 24),
            Text(
              'Total: Rp ${order.total.toStringAsFixed(0)}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${order.status}',
              style: TextStyle(
                color:
                    order.status.toLowerCase() == 'selesai'
                        ? Colors.green
                        : Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Tutup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
