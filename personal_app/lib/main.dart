import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mu Kamal',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            minRadius: 50,
            maxRadius: 150,
            backgroundImage: AssetImage("assets/images/personal.jpeg"),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "MUHAMMAD KAMAL",
              style: TextStyle(
                fontSize: 25,
                wordSpacing: 1.5,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Software Engineer",
              style: TextStyle(
                fontSize: 20,
                wordSpacing: 1.5,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            child: Card(
              elevation: 10,
              color: Colors.blueGrey,
              //it was container padding: EdgeInsets.all(15.0),
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  //it was a row children: <Widget>[
                  leading: Icon(
                    Icons.phone,
                    color: Colors.blueGrey[900],
                    size: 35.0,
                  ),
                  //SizedBox(width: 15.0,),
                  title: const Text(
                    '+201555786787',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
