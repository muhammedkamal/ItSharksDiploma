// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mu Kamal",
      theme: ThemeData(
        //appBarTheme: AppBarTheme(color: Colors.teal),
        primaryColor: Colors.blueGrey,
        accentColor: Colors.teal,
      ),
      home: Home(),
      //debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(
          "Kamal",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal),
        ),
      ), */
      // body: SafeArea(
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Container(
      //         constraints: BoxConstraints(maxHeight: 200, minHeight: 20),
      //         width: 100,
      //         // height: 200,
      //         color: Colors.red,
      //         // child: Text("red Container here"),
      //       ),
      //       Container(
      //         height: 20,
      //         width: 100,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         width: 20,
      //         height: 20,
      //         color: Colors.teal,
      //       ),
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.brown,
                backgroundImage: AssetImage("assets/images/p.jpeg"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                //padding: const EdgeInsets.only(top: 10.0, right: 20),
                child: Text(
                  "Kamal",
                  style: GoogleFonts.felipa(
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // style: TextStyle(
                  //   fontFamily: "Roboto",
                  //   fontSize: 22,
                  //   fontWeight: FontWeight.w900,
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              ContactCard(
                contactText: "+201555786787",
                url: "tel:+201555786787",
                iconData: Icons.phone,
              ),
              /* Card(
                //margin: EdgeInsets.all(10),
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.phone),
                      Text(
                        "+201555786787",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                //margin: EdgeInsets.all(10),
                color: Colors.blueGrey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mail),
                      Text(
                        "muhammedkamal022@gmail.com",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ), */
            ],
          ),
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  void _launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  final String contactText, url;
  final iconData;
  const ContactCard(
      {required this.contactText, required this.iconData, required this.url});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.blueGrey,
      child: ListTile(
        onTap: () {
          _launchURL(url);
        },
        leading: Icon(
          iconData,
          color: Colors.black,
          size: 30,
        ),
        title: Text(
          contactText,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
    );
  }
}
