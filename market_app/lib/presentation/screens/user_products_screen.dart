import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/blocs/products_bloc/product_bloc.dart';
import 'package:market_app/logic/providers/products_provider.dart';
import 'package:market_app/logic/providers/user_provider.dart';
import 'package:market_app/presentation/screens/add_product_screen.dart';
import 'package:market_app/presentation/widgets/user_product_item.dart';

import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddProductScreen()));
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          final products = BlocProvider.of<ProductsBloc>(context)
              .productsProvider
              .products
              .where((element) =>
                  element.ownerId ==
                  RepositoryProvider.of<UserProvider>(context).getUserId())
              .toList();
          if (state is ProductsLoading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemBuilder: (_, i) => Column(
                children: [
                  UserProductItem(products[i]),
                  Divider(),
                ],
              ),
              itemCount: products.length,
            ),
          );
        },
      ),
    );
  }
}
