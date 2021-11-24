import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/blocs/orders_bloc/orders_bloc.dart';
import 'package:market_app/logic/providers/cart_provider.dart';

import '../widgets/cart_item.dart' as w;

class CartScreen extends StatelessWidget {
  static String routeName = "/cartScreen";
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final cart = RepositoryProvider.of<CartProvider>(context);
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is OrdersLoaded) {
          cart.clearCart();
          Navigator.of(context).pushReplacementNamed("/");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                      ),
                      backgroundColor: themeData.primaryColor,
                    ),
                    BlocBuilder<OrdersBloc, OrdersState>(
                      builder: (context, state) {
                        if (state is OrdersLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return TextButton(
                            onPressed: () {
                              BlocProvider.of<OrdersBloc>(context).add(
                                AddOrder(
                                  cart.items.values.toList(),
                                  cart.totalAmount,
                                ),
                              );
                            },
                            child: const Text("Place Now"));
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, i) => w.CartItem(
                  id: cart.items.values.toList()[i].id,
                  productId: cart.items.keys.toList()[i],
                  price: cart.items.values.toList()[i].price,
                  quantity: cart.items.values.toList()[i].quantity,
                  title: cart.items.values.toList()[i].title,
                ),
                itemCount: cart.itemsCount,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
