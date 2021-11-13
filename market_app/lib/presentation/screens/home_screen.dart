import 'package:flutter/material.dart';
import 'package:market_app/data/models/product.dart';
import 'package:market_app/logic/providers/products_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Product> products = ProductsProvider().products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Text("Orders"),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Market App"),
        actions: [
          IconButton(
              onPressed: () {
                //TODO :: Impelement function
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, itemIndex) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridTile(
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
        ),
        itemCount: products.length,
      ),
    );
  }
}
