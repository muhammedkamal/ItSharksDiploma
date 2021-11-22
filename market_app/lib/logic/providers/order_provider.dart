import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:market_app/data/models/cart.dart';
import 'package:market_app/data/models/order.dart';
import 'package:market_app/logic/providers/user_provider.dart';

class OrdersProvider {
  List<Order> _orders = [];
  final UserProvider userProvider;
  OrdersProvider(this.userProvider);

  List<Order> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> products, double total) async {
    final userId = userProvider.getUserId();
    var url = Uri.parse(
        'https://market-15267-default-rtdb.firebaseio.com/orders/$userId.json');
    try {
      final resopnse = await http.post(url,
          body: json.encode({
            'amount': total,
            'timeStamp': DateTime.now().toIso8601String(),
            'products': products
                .map((p) => {
                      'id': p.id,
                      'price': p.price,
                      'quantity': p.quantity,
                      'title': p.title,
                    })
                .toList()
          }));
      if (resopnse.statusCode < 400) {
        _orders.insert(
          0,
          Order(
            id: json.decode(resopnse.body)['name'],
            amount: total,
            cartItems: products,
            dateTime: DateTime.now(),
          ),
        );
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchAndSetOrder() async {
    final userId = userProvider.getUserId();
    var url = Uri.parse(
        'https://market-15267-default-rtdb.firebaseio.com/orders/$userId.json');
    try {
      final response = await http.get(url);
      //print(response.body);
      final extractedDate = jsonDecode(response.body) as Map<String, dynamic>;
      final List<Order> loadedProducts = [];
      if (extractedDate == null) return;
      extractedDate.forEach((orderId, orderData) {
        loadedProducts.add(Order(
            id: orderId,
            amount: orderData["amount"],
            cartItems: (orderData['products'] as List<dynamic>)
                .map(
                  (e) => CartItem(
                    id: e['id'],
                    price: e['price'] as double,
                    quantity: e['quantity'],
                    title: e['title'],
                  ),
                )
                .toList(),
            dateTime: DateTime.parse(orderData["timeStamp"])));
      });
      _orders = loadedProducts;
    } catch (error) {}
  }
}
