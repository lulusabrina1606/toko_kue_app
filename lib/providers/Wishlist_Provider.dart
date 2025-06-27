import 'package:flutter/material.dart';
import '../models/cake.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Cake> _favorites = [];

  List<Cake> get favorites => _favorites;

  void toggleFavorite(Cake cake) {
    if (_favorites.contains(cake)) {
      _favorites.remove(cake);
    } else {
      _favorites.add(cake);
    }
    notifyListeners();
  }

  bool isFavorite(Cake cake) {
    return _favorites.contains(cake);
  }
}
