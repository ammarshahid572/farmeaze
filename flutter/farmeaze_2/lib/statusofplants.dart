import 'package:flutter/material.dart';
import 'addPotted.dart';
import 'button.dart';

class Status1 extends StatelessWidget {
  const Status1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 71, 1),
          title: const Text('Tomato'),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: Row(
              children: [
                Image(image: AssetImage('assets/images/tomato_plant.png')),
                Column(
                  children: [],
                )
              ],
            )));
  }
}
