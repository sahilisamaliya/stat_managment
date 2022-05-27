import 'package:flutter/material.dart';
import 'package:stat_managment/views/product_screen.dart';

void main() {
  runApp(MaterialApp(
    home: ProductScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class stat_managment extends StatefulWidget {
  const stat_managment({Key? key}) : super(key: key);

  @override
  State<stat_managment> createState() => _stat_managmentState();
}

class _stat_managmentState extends State<stat_managment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('state managment')),
      ),
      body: Center(child: Text("Getx Statemanagment in flutter")),
    );
  }
}
