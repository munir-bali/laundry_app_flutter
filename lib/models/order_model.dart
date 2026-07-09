class OrderModel {
  final int id;
  final String title;
  final num price;
  final String thumbnail;

  OrderModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
