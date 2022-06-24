import 'package:flutter/material.dart';

class StackUi extends StatefulWidget {
  const StackUi({Key? key}) : super(key: key);

  @override
  State<StackUi> createState() => _StackUiState();
}

class _StackUiState extends State<StackUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Stack(

        children: [
          Positioned(

            child: Container(
              height: 500,
              width: 400,
              color: Colors.black,
            ),
          ),
          Positioned(
            top: 300,
            left: 350,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.brown,
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 90,
            left: 90,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          Positioned(
            top: 250,
            left: 250,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
