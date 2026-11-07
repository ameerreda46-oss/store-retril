class ProductModel {
  final String id;
  final String name;
  final double price;
  final String unit; // e.g. "kg", "st"
  final String description;
  final String categoryId;
  final String iconEmoji; // For rich emoji/icon preview
  bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unit,
    required this.description,
    required this.categoryId,
    required this.iconEmoji,
    this.isFavorite = false,
  });
}
