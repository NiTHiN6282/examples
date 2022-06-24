import 'package:flutter/material.dart';

class HomeUi3 extends StatefulWidget {
  const HomeUi3({Key? key}) : super(key: key);

  @override
  State<HomeUi3> createState() => _HomeUi3State();
}

class _HomeUi3State extends State<HomeUi3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20.0, bottom: 20, top: 20, right: 20),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Gavriel",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 20,
                                ))),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            width: 107,
                            child: Row(
                              children: [
                                Image.asset("assets/hamburger.png", width: 30),
                                SizedBox(
                                  width: 15,
                                ),
                                Text('Fast Food'),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset("assets/healthyfood.png", width: 20),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Health Food'),
                            ],
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset("assets/fruit.png", width: 20),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Fruit'),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Text('Favorite',
              style: TextStyle(
                fontSize: 20,
              )),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset("assets/burger.jpg",
                          width: 70),
                          Text('Cheese Burger'),
                          Text('Fresh Patty'),



                        ],

                      ),


                    ),Row(



                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
