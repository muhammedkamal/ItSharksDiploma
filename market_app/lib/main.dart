import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:market_app/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:market_app/logic/blocs/orders_bloc/orders_bloc.dart';
import 'package:market_app/logic/blocs/products_bloc/product_bloc.dart';
import 'package:market_app/logic/notifications_manger.dart';
import 'package:market_app/logic/providers/cart_provider.dart';
import 'package:market_app/logic/providers/order_provider.dart';
import 'package:market_app/logic/providers/user_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initFirebaseNotification();
  }

  Future<void> initFirebaseNotification() async {
    NotificationsManger notificationsManger = NotificationsManger();
    await notificationsManger.firebaseInit();
    await notificationsManger.getToken();
  }

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
