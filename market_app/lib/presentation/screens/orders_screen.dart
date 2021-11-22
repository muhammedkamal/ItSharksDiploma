import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/blocs/orders_bloc/orders_bloc.dart';
import 'package:market_app/logic/providers/order_provider.dart';
import 'package:market_app/presentation/widgets/app_drawer.dart';
import 'package:market_app/presentation/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersdata = RepositoryProvider.of<OrdersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is OrdersInitial) {
            BlocProvider.of<OrdersBloc>(context).add(LoadAllOrders());
          } else if (state is OrdersLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: ordersdata.orders.length,
            itemBuilder: (context, i) => OrderItem(ordersdata.orders[i]),
          );
        },
      ),
    );
  }
}
