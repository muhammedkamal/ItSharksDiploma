import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final String id, title, productId;
  final int quantity;
  final double price;
  CartItem({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 8),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (dir) {},
      confirmDismiss: (dir) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Remove Product'),
            content: Text(
                'Are you really want to remove this product out of your Cart?'),
            actions: [
              TextButton(
                onPressed: () {
                  RepositoryProvider.of<CartProvider>(context)
                      .removeItem(productId);
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'No',
                ),
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text('\$${price.toStringAsFixed(2)}'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
