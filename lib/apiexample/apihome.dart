import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String? stringResponse;
Map? mapResponse;
String? pincode="";

class ApiHomePage extends StatefulWidget {
  const ApiHomePage({Key? key}) : super(key: key);

  @override
  State<ApiHomePage> createState() => _ApiHomePageState();
}

class _ApiHomePageState extends State<ApiHomePage> {
  TextEditingController pincodeController = TextEditingController();

  Future apicall() async{
    http.Response response;
    response=await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?zip="+pincode!+",In&appid=4af65613b64e5b6654ebc1da1880e831"));
    if(response.statusCode==200){
      setState((){
        stringResponse = response.body;
        mapResponse=json.decode(response.body);
      });
    }
  }

  @override
  void initState(){
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(

        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Enter pincode"),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFormField(
                              controller: pincodeController,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: (){
                                pincode=pincodeController.text;
                                setState((){});
                                apicall();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Text("Go")
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      mapResponse==null?Text("No Results..."):
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(mapResponse!['name'].toString()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                        image: AssetImage(
                                              mapResponse!['weather'][0]['main']=="Clouds"?"assets/images/clouds.gif":
                                              mapResponse!['weather'][0]['main']=="Rain"?"assets/images/rain.gif":
                                              mapResponse!['weather'][0]['main']=="Thunder"?"assets/images/thunder.gif":""
                                        )
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text((mapResponse!['main']['temp']-273.15).toStringAsFixed(0)+"\u2103",
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: Colors.orange,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black.withOpacity(1),
                                                offset: Offset(1, 2),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),),
                                          Text(mapResponse!['weather'][0]['main'].toString(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.orangeAccent,
                                                shadows: [
                                                  Shadow(
                                                    color: Colors.black.withOpacity(1),
                                                    offset: Offset(1, 2),
                                                    blurRadius: 5,
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Image.network("http://openweathermap.org/img/w/"+mapResponse!['weather'][0]['icon']+".png",
                                    )
                                  ],
                                ),
                              ),
                              // Text("Location: "+mapResponse!['name'].toString()),
                              // Text("Lattitude: "+mapResponse!['coord']['lat'].toString()),
                              // Text("Longitude: "+mapResponse!['coord']['lon'].toString()),
                              // Text(mapResponse!['weather'][0]['main'].toString()),
                              // Text(mapResponse!['weather'][0]['description'].toString()),
                              // Text("Humidty: "+mapResponse!['main']['humidity'].toString()+"%"),
                              // Text(("Visibility "+(mapResponse!['visibility']/1000).toString())+"km"),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Image.network("http://openweathermap.org/img/w/"+mapResponse!['weather'][0]['icon']+".png"),
                              //     Text((mapResponse!['main']['temp']-273.15).toStringAsFixed(0)+"\u2103")
                              //   ],
                              // )
                            ],
                          )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
