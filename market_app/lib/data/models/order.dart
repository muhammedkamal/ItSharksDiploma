import 'cart.dart';

class Order {
  final String id;
  final double amount;
  final List<CartItem> cartItems;
  final DateTime dateTime;
  Order({
    required this.id,
    required this.amount,
    required this.cartItems,
    required this.dateTime,
  });
}
