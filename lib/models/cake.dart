class Cake {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;
  final double rating;
  final bool isBestSeller;

  Cake({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
    required this.isBestSeller,
  });

  // Agar bisa dipakai di Map dan perbandingan (untuk cart, dsb)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cake && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
