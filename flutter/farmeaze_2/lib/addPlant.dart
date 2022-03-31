import 'package:flutter/material.dart';
import 'addPotted.dart';
import 'button.dart';

class AddPlant extends StatelessWidget {
  const AddPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 3, 71, 1),
          title: const Text('Add a Plant'),
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
                        title: "Potted",
                        image: Image.asset('assets/images/potted.png'),
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddPottedPlant()));
                        },
                      )),
                  new Container(
                      height: 100,
                      width: 100,
                      child: ImageButton(
                        title: "Seedbed",
                        callback: () {},
                        image: Image.asset('assets/images/seedbed.jpg'),
                      )),
                  new Container(
                      height: 100,
                      width: 100,
                      child: ImageButton(
                        title: "Aquaponic",
                        callback: () {},
                        image: Image.asset('assets/images/aquaponic.png'),
                      )),
                  new Container(
                      height: 100,
                      width: 100,
                      child: ImageButton(
                        title: "Garden",
                        callback: () {},
                        image: Image.asset('assets/images/garden.png'),
                      )),
                ])));
  }
}
