import 'package:flutter/material.dart';
import 'package:foodonline/pages/home/home_page.dart';
import 'package:foodonline/pages/map.dart';
import 'package:foodonline/pages/seller_order/seller_intro_page.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int myIndex = 0;
  List<Widget> myPages = [
    HomePage(),
    SellerIntro(),
    MapPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myPages[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Color.fromARGB(255, 12, 89, 205),
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex, // this will be set when a new tab is tapped
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],

        selectedItemColor: Color.fromARGB(255, 221, 232, 25),
      ),
    );
  }
}
