import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodonline/pages/route/routing_page.dart';
import 'package:foodonline/pages/seller_order/seller_intro_page.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class SellerOrderDetails extends StatefulWidget {
  const SellerOrderDetails({Key? key}) : super(key: key);

  @override
  State<SellerOrderDetails> createState() => _SellerOrderDetailsState();
}

class _SellerOrderDetailsState extends State<SellerOrderDetails> {
  TextEditingController foodName = TextEditingController();
  TextEditingController foodPrice = TextEditingController();
  TextEditingController nos = TextEditingController();
  TextEditingController providerName = TextEditingController();

  final CollectionReference _foodorder =
      FirebaseFirestore.instance.collection('food');

  String foodType = '';

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    void add() {
      var data = {
        'foodName': foodName.text,
        'foodPrice': foodPrice.text,
        'nos': nos.text,
        'foodType': foodType,
        'providerName': providerName.text,
      };
      _foodorder
          .doc(uuid.v1())
          .set(data)
          .onError((error, stackTrace) => print(error));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: providerName,
                  decoration: InputDecoration(
                    hintText: 'Food Provider Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: foodName,
                  decoration: InputDecoration(
                    hintText: 'food name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: foodPrice,
                  decoration: InputDecoration(
                    hintText: 'food price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                TextFormField(
                  controller: nos,
                  decoration: InputDecoration(
                    hintText: 'no fo servings',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                RadioListTile(
                  title: Text("Breakfast"),
                  value: "breakfast",
                  groupValue: foodType,
                  onChanged: (value) {
                    setState(() {
                      foodType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Lunch"),
                  value: "lunch",
                  groupValue: foodType,
                  onChanged: (value) {
                    setState(() {
                      foodType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Snacks"),
                  value: "snacks",
                  groupValue: foodType,
                  onChanged: (value) {
                    setState(() {
                      foodType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Dinner"),
                  value: "dinner",
                  groupValue: foodType,
                  onChanged: (value) {
                    setState(() {
                      foodType = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Other"),
                  value: "other",
                  groupValue: foodType,
                  onChanged: (value) {
                    setState(() {
                      foodType = value.toString();
                    });
                  },
                ),
                SizedBox(height: 20),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    add();
                    RoutingPage.goToNext(
                        context: context, navigateTo: SellerIntro());
                  },
                  child: Text('Push Order'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
