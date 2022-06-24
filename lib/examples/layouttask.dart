import 'package:flutter/material.dart';

class LayoutTask extends StatefulWidget {
  const LayoutTask({Key? key}) : super(key: key);

  @override
  State<LayoutTask> createState() => _LayoutTaskState();
}

class _LayoutTaskState extends State<LayoutTask> {
  @override
  Widget build(BuildContext context) {
    var scrwidth=MediaQuery.of(context).size.width;
    var scrheight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: scrheight/7,
              color: Colors.black,
            ),
            Row(
              children: [
                Container(
                  width: scrwidth/3,
                  height: scrheight/3.5,
                  color: Colors.blue,
                ),
                Column(
                  children: [
                    Container(
                      height: scrheight/7,
                      width: scrwidth/3,
                      color: Colors.black,
                    ),
                    Container(
                      color: Colors.green,
                      height: scrheight/7,
                      width: scrwidth/3,
                    )
                  ],
                ),
                Container(
                  color: Colors.green,
                  height: scrheight/3.5,
                  width: scrwidth/3,
                )
              ],
            ),

            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.red,
                        width: scrwidth/3,
                        height: scrheight/7,
                      ),
                      Container(
                        color: Colors.yellow,
                        width: scrwidth/3,
                        height: scrheight/7,
                      ),
                      Container(
                        color: Colors.black,
                        width: scrwidth/3,
                        height: scrheight/7,
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.yellow,
                    width: scrwidth/1.5,
                    height: scrheight/2.34,
                  )
                ],
              ),
            ),

            Container(
              color: Colors.black,
              height: scrheight/7,

            )
          ],
        ),
      )
    );
  }
}
