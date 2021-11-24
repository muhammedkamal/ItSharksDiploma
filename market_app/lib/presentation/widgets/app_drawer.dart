import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:market_app/presentation/screens/auth_screen.dart';
import 'package:market_app/presentation/screens/orders_screen.dart';
import 'package:market_app/presentation/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend !'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      BlocProvider.of<AuthBloc>(context).state is Authunticated
                          ? const OrdersScreen()
                          : AuthScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Your Products'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>
                      BlocProvider.of<AuthBloc>(context).state is Authunticated
                          ? UserProductsScreen()
                          : AuthScreen(),
                ),
              );
            },
          ),
          Divider(),
          if (BlocProvider.of<AuthBloc>(context).state is Authunticated)
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
