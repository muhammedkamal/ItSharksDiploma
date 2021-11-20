import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/data/models/product.dart';
import 'package:market_app/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:market_app/logic/blocs/products_bloc/product_bloc.dart';
import 'package:market_app/presentation/screens/add_product_screen.dart';
import 'package:market_app/presentation/screens/auth_screen.dart';
import 'package:market_app/presentation/screens/single_producr.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(onPressed: () {}, child: Text("Orders")),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Market App"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.of<AuthBloc>(context)
                            .state is Authunticated
                        ? AddProductScreen()
                        : AuthScreen()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProductsBloc>(context).add(LoadAllProducts());
        },
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            final _ProductsBloc = BlocProvider.of<ProductsBloc>(context);
            if (state is ProductInitial) {
              _ProductsBloc.add(LoadAllProducts());
            } else if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductsLoadingFailed) {
              return const Center(
                child: Text("Unexpected error occured pull down to refersh!"),
              );
            } else if (state is ProductsLoaded) {
              List<Product> products = state.productsList;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5),
                itemBuilder: (context, itemIndex) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(products[itemIndex].id!)));
                  },
                  child: GridTile(
                    header: Container(
                      color: const Color.fromRGBO(0, 0, 0, 0.4),
                      child: ListTile(
                        tileColor: const Color.fromRGBO(0, 0, 0, 0.6),
                        leading: IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {},
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.shopping_basket),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    child: Hero(
                      tag: products[itemIndex].id!,
                      child: Image.network(
                        products[itemIndex].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                itemCount: products.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
/* StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("products").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("An error Has Occured ty again later"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data == null) {
              return Center(
                child: Text("No Products to be shown"),
              );
            }
            for (var document in snapshot.data!.docs) {
              products.add(Product.fromSnapshot(document));
              products.last.id = document.id;
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 5),
              itemBuilder: (context, itemIndex) => GridTile(
                header: Container(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  child: ListTile(
                    tileColor: Color.fromRGBO(0, 0, 0, 0.6),
                    leading: IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {},
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.shopping_basket),
                      onPressed: () {},
                    ),
                  ),
                ),
                child: Image.network(
                  products[itemIndex].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              itemCount: products.length,
            );
          }), */