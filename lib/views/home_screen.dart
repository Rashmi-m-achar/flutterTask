// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> widgetOptions = <Widget>[
    HomeScreenPage(),
    SearchScreenPage(),
    ProfileScreenPage(),
    BagScreenPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Brightness systemBrightness =
        MediaQuery.of(context).platformBrightness;

    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: systemBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: Scaffold(
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Stack(
          children: [
            BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/homeIcon.png',
                    width: 50.0,
                    height: 50.0,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/empty-wallet.png',
                    width: 50.0,
                    height: 50.0,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/botom2crlLogo.png',
                    width: 50.0,
                    height: 50.0,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/shoping.png',
                    width: 50.0,
                    height: 50.0,
                    color: Colors.black,
                  ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.blue,
              iconSize: 30,
              onTap: _onItemTapped,
              elevation: 2,
            ),
            Positioned(
              top: 0,
              left: (_selectedIndex * MediaQuery.of(context).size.width / 4) +
                  (MediaQuery.of(context).size.width / 8) -
                  25,
              child: Container(
                width: 50,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/profile.png',
            height: 30,
            width: 30,
          ),
          onPressed: () {
            print("ok");
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/headerSetting.png',
                height: 100.0,
                width: 100.0,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/bellIcon.png',
                height: 30,
                width: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 180.0,
                decoration: BoxDecoration(
                    color: Color(0xFF177DFF),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Wallet',
                              style: TextStyle(color: Colors.white)),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text('MSD',
                                style: TextStyle(color: Colors.white)),
                            icon: Icon(Icons.expand_more, color: Colors.white),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white12,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$8,540.00',
                          style: TextStyle(fontSize: 40.0, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 5.0, right: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Text('Transfer',
                                style: TextStyle(color: Colors.white)),
                            icon: Image.asset(
                              'assets/icons/bitcoin-convert.png',
                              color: Colors.white,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text('Deposit',
                                style: TextStyle(color: Colors.white)),
                            icon: Image.asset(
                              'assets/icons/bitcoin-convert.png',
                              color: Colors.white,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white12,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text('Swap',
                                style: TextStyle(color: Colors.white)),
                            icon: Image.asset(
                              'assets/icons/bitcoin-convert.png',
                              color: Colors.white,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white12,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Container(
              height: 60.0,
              decoration: BoxDecoration(
                  // border: Border.all(width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xFFE8F2FF)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/bLogo.png',
                    color: Colors.black,
                  ),
                  Text(
                    "BTC",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    '0.00000045',
                    style: TextStyle(color: Color(0xFF39A798)),
                  ),
                  Image.asset(
                    'assets/icons/risingLogo.png',
                    color: Color(0xFF089775),
                  ),
                  Text(
                    '3.8%',
                    style: TextStyle(color: Color(0xFF39A798)),
                  )
                ],
              )),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recommended",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
                // border: Border.all(width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFE8F2FF)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/icons/cryptoLogoYellow.png',
                            ),
                            Text("BNB"),
                            Image.asset(
                              'assets/icons/risingLogo.png',
                              color: Colors.black,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '+1.37',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '216.3',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/icons/cryptoLogoBlue.png',
                            ),
                            Text("ADL"),
                            Image.asset(
                              'assets/icons/risingLogo.png',
                              color: Colors.black,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '+2.72',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              '0.4976',
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "My Assets",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
              height: 60.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/bLogo.png',
                      ),
                      Text("Bitcoin"),
                      Text("\$4,500.00")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/icons/decresinggphLogo.png',
                      ),
                      Text("45% \$12.5"),
                      Text("0.0000056 BTC"),
                    ],
                  )
                ],
              )),
          // Expanded(
          //   child: Container(
          //       height: 10.0,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10.0),
          //           color: Colors.white),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //               Image.asset(
          //                 'assets/icons/tLogo.png',
          //               ),
          //               Text("Tether"),
          //               Text("\$2,200.00"),
          //             ],
          //           )
          //         ],
          //       )),
          // ),
        ],
      ),
    );
  }
}

class SearchScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'pending',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProfileScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'pending',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BagScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          'pending',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
