import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String? description;
  String? id;
  double price;
  int amount;
  String imageUrl;
  String ownerId;
  Product({
    required this.name,
    required this.amount,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.ownerId,
    this.id,
  });
  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      name: data["name"],
      amount: int.parse(data["amount"]),
      description: data["description"],
      imageUrl: data["imageUrl"],
      price: double.parse(data["price"]),
      ownerId: data['owner_id'],
    );
  }
  factory Product.fromSnapshot(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data()! as Map<String, dynamic>;
    return Product(
      name: data["name"],
      amount: int.parse(data["amount"]),
      description: data["description"],
      imageUrl: data["imageUrl"],
      price: double.parse(data["price"]),
      id: snap.id,
      ownerId: data['owner_id'],
    );
  }
  Map<String, dynamic> toMap(Product product) {
    return {
      "name": name,
      "price": price,
      "amount": amount,
      "imageUrl": imageUrl,
      "description": description,
    };
  }
}
