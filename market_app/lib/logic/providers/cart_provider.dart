import 'package:market_app/data/models/cart.dart';

class CartProvider {
  Map<String, CartItem> _items =
      {}; // key is the product id to connect cart with products

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  void addItem(
      {required String productId,
      required String title,
      required double price}) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (exsistingCartItem) => CartItem(
          id: exsistingCartItem.id,
          title: exsistingCartItem.title,
          price: exsistingCartItem.price,
          quantity: exsistingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title,
        ),
      );
    }
  }

  void removeItem(String prodId) {
    _items.remove(prodId);
  }

  void removeSingleItem(String prodId) {
    if (!_items.containsKey(prodId)) return;
    if (_items[prodId]!.quantity > 1)
      _items.update(
          prodId,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              quantity: value.quantity - 1,
              title: value.title));
    else
      _items.remove(prodId);
  }

  void clearCart() {
    _items = {};
  }
}
