import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? title;
  final void Function() callback;

  const Button({Key? key, this.title, required this.callback()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25),
        child: ElevatedButton(
            onPressed: () {
              callback();
            },
            child: Text(title!),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(10, 10),
                primary: Color.fromARGB(255, 3, 71, 1),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold))));
  }
}

class ImageButton extends StatelessWidget {
  final String? title;
  final void Function() callback;
  final Image image;
  const ImageButton(
      {Key? key, this.title, required this.callback(), required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25),
        child: ElevatedButton(
            onPressed: () {
              callback();
            },
            child: Center(
                child: GridView.count(
                    crossAxisCount: 2,
                    children: [Center(child: Text(title!)), image])),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(10, 10),
                primary: Color.fromARGB(255, 3, 71, 1),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold))));
  }
}
