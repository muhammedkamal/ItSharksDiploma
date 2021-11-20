import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  UserProductItem(this.productId);
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    final prod =
        Provider.of<Products>(context, listen: false).findById(productId);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(prod.imageUrl),
      ),
      title: Text(prod.title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName,
                    arguments: productId);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(productId);
                } catch (_) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('Delete has Failed!'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
