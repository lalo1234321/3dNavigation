import 'package:flutter/material.dart';
class AnimalPage extends StatefulWidget {
  @override
  _AnimalPageState createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("3D Drawer Menu"),
      ),
      body: Center(
        child: Text("swipe to the left "),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("boton de la página principal");
        },
      ),
    );
  }
}