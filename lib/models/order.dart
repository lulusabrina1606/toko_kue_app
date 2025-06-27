import 'order_item.dart';

class Order {
  final String id;
  final DateTime date;
  final List<OrderItem> items;
  final double total;
  final String status;

  Order({
    required this.id,
    required this.date,
    required this.items,
    required this.total,
    required this.status,
  });
}
