import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_app/data/models/product.dart';
import 'package:market_app/logic/providers/products_provider.dart';
import 'package:market_app/presentation/screens/add_product_screen.dart';

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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddProductScreen()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
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
              Map<String, dynamic> productFormFireStore =
                  document.data()! as Map<String, dynamic>;
              print(productFormFireStore);
              products.add(Product.fromJson(productFormFireStore));
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
          }),
    );
  }
}
