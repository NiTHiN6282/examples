import 'package:flutter/material.dart';

class TabBarUi extends StatefulWidget {
  const TabBarUi({Key? key}) : super(key: key);

  @override
  State<TabBarUi> createState() => _TabBarUiState();
}

class _TabBarUiState extends State<TabBarUi> with TickerProviderStateMixin {
  List<String> tabList=[
    "App",
    "Game",
    "Media"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController=TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DefaultTabController(
                length: 3,
                child: TabBar(
                    unselectedLabelColor: Colors.redAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.redAccent),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(tabList[1],
                                  style: TextStyle(
                                      fontSize: 16
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(tabList[2],
                                  style: TextStyle(
                                      fontSize: 16
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Tab(

                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(tabList[0],
                                  style: TextStyle(
                                      fontSize: 16
                                  ),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
