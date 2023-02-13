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
        body: Center(
          child: Container(
            child: MaterialButton(
              color: Colors.red,
              onPressed: () {
                RoutingPage.goToNext(
                    context: context, navigateTo: SellerOrderDetails());
              },
              child: Text('Push Order'),
            ),
          ),
        ),
      ),
    );
  }
}
