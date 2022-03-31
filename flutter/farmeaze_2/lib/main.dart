import 'package:farmeaze_2/services.dart';
import 'package:farmeaze_2/statusofplants.dart';
import 'package:flutter/material.dart';

import 'addPlant.dart';
import 'button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 71, 1),
          title: const Text('Home'),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: new Column(children: [
              new Container(
                height: 200,
                width: 400,
                child: Button(
                  key: null,
                  title: "Status of Plants",
                  callback: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Status1()));
                  },
                ),
              ),
              new Container(
                  height: 200,
                  width: 400,
                  child: Button(
                    key: null,
                    title: "Add Plant",
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddPlant()));
                    },
                  )),
              new Container(
                  height: 200,
                  width: 400,
                  child: Button(
                    key: null,
                    title: "Services",
                    callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Services()));
                    },
                  ))
            ])));
  }
}
