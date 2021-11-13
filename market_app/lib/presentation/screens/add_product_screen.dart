import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _key = GlobalKey<FormState>();
  bool _validating = false;
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            autovalidateMode: _validating
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      data['name'] = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "your product name",
                    label: Text("Title"),
                  ),
                  validator: (value) {
                    if (value!.length < 4) {
                      return "Tile Can noy be less than 4 letters";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      data['description'] = value;
                    });
                  },
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "your product description",
                    label: Text("Description"),
                  ),
                  validator: (value) {
                    /* if (value!.length < 150) {
                      return "Tile Can noy be less than 4 letters";
                    } */
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      data['price'] = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "your product price",
                    label: Text("price"),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    /* if (value!.length < 4) {
                      return "Tile Can noy be less than 4 letters";
                    } */
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      data['amount'] = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "your product amount",
                    label: Text("amount"),
                  ),
                  validator: (value) {
                    /* if (value!.length < 4) {
                      return "Tile Can noy be less than 4 letters";
                    }
                    return null; */
                  },
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      data['imageUrl'] = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "your product image Url",
                    label: Text("Image Url"),
                  ),
                  validator: (value) {
                    /* if (value!.length < 4) {
                      return "Tile Can noy be less than 4 letters";
                    } */
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        FirebaseFirestore.instance
                            .collection('products')
                            .add(data);
                      } else {
                        setState(() {
                          _validating = true;
                        });
                      }
                    },
                    child: Text("Add Product"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
