import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartItems;
  final DateTime dateTime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.cartItems,
    required this.dateTime,
  });
}
