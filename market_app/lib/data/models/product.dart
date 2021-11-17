class Product {
  final String name;
  final String? description;
  late String id;
  final double price;
  final int amount;
  final String imageUrl;
  Product({
    required this.name,
    required this.amount,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      name: data["name"],
      amount: int.parse(data["amount"]),
      description: data["description"],
      imageUrl: data["imageUrl"],
      price: double.parse(data["price"]),
    );
  }
  Map<String, dynamic> toMap(Product product) {
    return {
      "name": name,
      "price": price,
      "amount": amount,
      "imageUrl": imageUrl,
      "description": description,
      "id": id,
    };
  }
}
