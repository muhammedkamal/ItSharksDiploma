import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String productId;
  UserProductItem(this.productId);
  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage("prod.imageUrl"),
      ),
      title: Text("prod.title"),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () async {
                try {} catch (_) {
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
