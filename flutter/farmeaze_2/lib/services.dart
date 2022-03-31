import 'package:flutter/material.dart';
import 'button.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 71, 1),
          title: const Text('Our Services'),
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
                  title: "Order Seeds",
                  callback: () {},
                ),
              ),
              new Container(
                  height: 200,
                  width: 400,
                  child: Button(
                    key: null,
                    title: "Order Fertilizers",
                    callback: () {},
                  )),
              new Container(
                  height: 200,
                  width: 400,
                  child: Button(
                    key: null,
                    title: "Order Equipment",
                    callback: () {},
                  ))
            ])));
  }
}
