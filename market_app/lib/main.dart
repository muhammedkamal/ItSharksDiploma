import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:market_app/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:market_app/logic/blocs/orders_bloc/orders_bloc.dart';
import 'package:market_app/logic/blocs/products_bloc/product_bloc.dart';
import 'package:market_app/logic/providers/cart_provider.dart';
import 'package:market_app/logic/providers/order_provider.dart';
import 'package:market_app/logic/providers/products_provider.dart';
import 'package:market_app/logic/providers/user_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserProvider(),
      child: RepositoryProvider(
        create: (context) => CartProvider(),
        child: RepositoryProvider(
          create: (context) => OrdersProvider(
            RepositoryProvider.of<UserProvider>(context),
          ),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    AuthBloc(RepositoryProvider.of<UserProvider>(context)),
              ),
              BlocProvider(create: (context) => ProductsBloc()),
              BlocProvider(
                create: (context) => CartBloc(
                  RepositoryProvider.of<CartProvider>(context),
                ),
              ),
              BlocProvider(
                create: (context) => OrdersBloc(
                  RepositoryProvider.of<OrdersProvider>(context),
                ),
              ),
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomeScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
