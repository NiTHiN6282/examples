import 'package:flutter/material.dart';

class DrawerBtmNavbar extends StatefulWidget {
  const DrawerBtmNavbar({Key? key}) : super(key: key);

  @override
  State<DrawerBtmNavbar> createState() => _DrawerBtmNavbarState();
}

class _DrawerBtmNavbarState extends State<DrawerBtmNavbar> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  dynamic _widgetOptions = <Widget>[
    Container(
      color: Colors.yellow,
      width: 100,
      height: 100,
    ),
    Container(
      color: Colors.black,
      width: 100,
      height: 100,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Header")
                    ],
                  ),
                )
            ),
            ListTile(
              title: Text("First"),
              onTap: (){

              },
            ),
            Divider(),
            ListTile(
              title: Text("First"),
              onTap: (){

              },
            ),
            Divider(),
            ListTile(
              title: Text("First"),
              onTap: (){

              },
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Icon(
            Icons.logout,
          ),
          SizedBox(
            width: 7,
          )
        ],
      ),
      body: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }
}
