import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/product.dart';

class ProductsProvider {
  final productsCollection = FirebaseFirestore.instance.collection("products");
  List<Product> products = [];
  Future<bool> addNewProduct(Map<String, dynamic> product) async {
    try {
      await productsCollection.add(product);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<bool> deleteProduct(String productId) async {
    try {
      await productsCollection.doc(productId).delete();
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<Product>> getProductsFromFirebase() async {
    final snapShot = await productsCollection.get();
    products = [];
    try {
      for (var item in snapShot.docs) {
        products.add(Product.fromSnapshot(item));
      }
    } catch (e) {
      rethrow;
    }
    return products;
  }

  Future<bool> updateProduct(Product product) async {
    try {
      await productsCollection.doc(product.id).update(
            product.toMap(product),
          );
    } catch (e) {
      return false;
    }
    return true;
  }
}
