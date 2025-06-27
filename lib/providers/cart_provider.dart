import 'package:flutter/foundation.dart';
import '../models/cake.dart';
import '../models/order.dart';
import '../models/order_item.dart';

class CartProvider with ChangeNotifier {
  // Map key-nya Cake, value-nya jumlah item
  final Map<Cake, int> _items = {};

  // List riwayat order
  final List<Order> _orders = [];

  Map<Cake, int> get items => _items;

  List<Order> get orders => _orders;

  List<Order> get orderHistory => _orders;

  void addToCart(Cake cake) {
    if (_items.containsKey(cake)) {
      _items[cake] = _items[cake]! + 1;
    } else {
      _items[cake] = 1;
    }
    print('Cart sekarang: $_items');
    notifyListeners();
  }

  void removeItem(Cake cake) {
    _items.remove(cake);
    notifyListeners();
  }

  void increaseQuantity(Cake cake) {
    if (_items.containsKey(cake)) {
      _items[cake] = _items[cake]! + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(Cake cake) {
    if (_items.containsKey(cake) && _items[cake]! > 1) {
      _items[cake] = _items[cake]! - 1;
    } else {
      _items.remove(cake);
    }
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    _items.forEach((cake, quantity) {
      total += cake.price * quantity;
    });
    return total;
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Perbaikan addOrder supaya sesuai Order model
  void addOrder() {
    if (_items.isEmpty) return;

    final orderItems =
        _items.entries
            .map((entry) => OrderItem(cake: entry.key, quantity: entry.value))
            .toList();

    final newOrder = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // id unik
      items: orderItems,
      date: DateTime.now(),
      total: totalPrice,
      status: 'Selesai',
    );

    _orders.add(newOrder);
    clearCart();
    notifyListeners();
  }
}
