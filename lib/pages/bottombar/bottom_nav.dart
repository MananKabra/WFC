import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.shopping_cart),
    Icon(Icons.mail),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: body[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.mail),
          //   label: 'Mail',
          // ),
        ],
      ),
    );
  }
}
