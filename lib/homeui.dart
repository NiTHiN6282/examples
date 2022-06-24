import 'package:flutter/material.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({Key? key}) : super(key: key);

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {

  List<Map<String,dynamic>> burger=[
    {
      "img":"assets/burger.jpg",
      "name":"Burger1",
      "rating":"kmks"
    },
    {
      "img":"assets/burger2.jpg",
      "name":"Burger2",
      "rating":""
    },
    {
      "img":"assets/burger3.jpg",
      "name":"Burger3",
      "rating":""
    },
    {
      "img":"assets/burger4.jpg",
      "name":"Burger4",
      "rating":""
    },
  ];

  @override
  Widget build(BuildContext context) {
    var phnheight=MediaQuery.of(context).size.height;
    var phnwidth=MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 250,
              width: phnwidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/burger1.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Burgers",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(3.0, 3.0),
                        blurRadius: 8.0,
                        color: Color.fromARGB(125, 0, 0, 0),
                      ),
                    ],
                  ),)
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Burger",
                  style: TextStyle(
                    fontSize: 25,
                  ),),
                  Icon(Icons.filter_list),
                ],
              ),
            ),

            // Container(
            //   padding: EdgeInsets.only(left: 10),
            //   child: Row(
            //     children: [
            //       Image.asset("assets/burger.jpg",width: 100,),
            //
            //     ],
            //   ),
            // )

            Flexible(
              child: ListView.builder(
                  itemCount: burger.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 10),
                      child: Row(
                        children: [
                          Image.asset(burger[index]['img'],
                          width: 100,),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(burger[index]['name'],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star),
                                  SizedBox(
                                    height: 45,
                                  ),
                                  Text("1499 Ratings")
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Icon(Icons.favorite_border,
                          size: 30,)
                        ],
                      ),
                    );

                  }),
            ),

          ],
        ),
      ),
    );
  }
}
