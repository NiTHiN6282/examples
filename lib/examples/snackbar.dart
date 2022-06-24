import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar._();
  static customSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("$message"),

        )
    );
  }
}

class SnackBarUi extends StatefulWidget {
  const SnackBarUi({Key? key}) : super(key: key);

  @override
  State<SnackBarUi> createState() => _SnackBarUiState();
}

class _SnackBarUiState extends State<SnackBarUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(onPressed: (){
            CustomSnackBar.customSnackbar(context, "This is a SnackBar!");
          },
              child: Text("show")),
        ),
      ),
    );
  }
}
