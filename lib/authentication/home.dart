import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: (){
              FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false));
            },
            child: Icon(
              Icons.logout
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text("Home")
          ],
        ),
      ),
    );
  }
}
