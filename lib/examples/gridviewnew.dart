import 'package:flutter/material.dart';

class GridViewNew extends StatefulWidget {
  const GridViewNew({Key? key}) : super(key: key);

  @override
  State<GridViewNew> createState() => _GridViewNewState();
}

class _GridViewNewState extends State<GridViewNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
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
            ),
            Container(
              child: GridView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                 mainAxisExtent: 120,mainAxisSpacing: 10,crossAxisSpacing: 10),
              children: [
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.purple,
                ),
              ],
              ),
            ),

          ],
        ),
      )),
    );
  }
}
