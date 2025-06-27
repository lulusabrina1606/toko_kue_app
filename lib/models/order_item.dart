// models/order_item.dart
import 'cake.dart';

class OrderItem {
  final Cake cake; // Cake yang dipesan
  final int quantity; // Jumlah item

  OrderItem({required this.cake, required this.quantity});
}
