import 'package:flutter/material.dart';
import 'button.dart';

class AddPottedPlant extends StatelessWidget {
  const AddPottedPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 71, 1),
          title: const Text('Add a New Potted Plant'),
        ),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.jpg"),
                    fit: BoxFit.cover)),
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                children: [
                  new Container(
                      height: 100,
                      width: 100,
                      child: ImageButton(
                        title: "Tomato",
                        image: Image.asset('assets/images/tomato.png'),
                        callback: () {},
                      )),
                  new Container(
                      height: 100,
                      width: 100,
                      child: ImageButton(
                        title: "Lettuce",
                        callback: () {},
                        image: Image.asset('assets/images/lettuce.png'),
                      )),
                ])));
  }
}
