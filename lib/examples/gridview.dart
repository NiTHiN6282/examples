import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  const GridViewExample({Key? key}) : super(key: key);

  @override
  State<GridViewExample> createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.amber,
                    child: Center(child: Text('${index+1}')),
                  );
                }
            ),
          )
      ),
    );
  }
}
