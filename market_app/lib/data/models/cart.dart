import 'package:market_app/data/models/product.dart';

class CartItem {
  String id, title;
  int quantity;
  double price;
  CartItem({
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
  });
}
