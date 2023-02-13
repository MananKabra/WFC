import 'package:flutter/material.dart';
import 'package:foodonline/pages/route/routing_page.dart';
import 'package:foodonline/pages/seller_order/seller_order_details.dart';

class SellerIntro extends StatefulWidget {
  const SellerIntro({super.key});

  @override
  State<SellerIntro> createState() => _SellerIntroState();
}

class _SellerIntroState extends State<SellerIntro> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/makescreen.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
                child: Text('Give what you can!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        backgroundColor: Color.fromARGB(255, 250, 244, 177),
                        fontSize: 30,
                        color: Color.fromARGB(255, 3, 73, 237))))),
        floatingActionButton: FloatingActionButton(
          // Change size of button and icon to big
          mini: false,

          onPressed: () {
            RoutingPage.goToNext(
                context: context, navigateTo: SellerOrderDetails());
          },
          backgroundColor: Color.fromARGB(255, 7, 213, 220),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 3, 73, 237),
          ),
        ),
      ),
    );
  }
}
