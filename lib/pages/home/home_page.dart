import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foodonline/pages/bottombar/bottom_nav.dart';
import 'package:foodonline/pages/login/login_page_seller.dart';
import 'package:foodonline/pages/map.dart';
import 'package:foodonline/pages/model/uder_model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:foodonline/pages/home/home_page.dart';
import 'package:firebase_database/firebase_database.dart';

import '../login/login_page_buyer.dart';
import '../route/routing_page.dart';

//late UserModel userModel;

class User {
  final String foodName;
  final String foodPrice;
  final String nos;
  final String foodType;
  final String providerName;

  User(
      {required this.foodName,
      required this.foodPrice,
      required this.nos,
      required this.foodType,
      required this.providerName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      foodName: json['foodName'],
      foodPrice: json['foodPrice'],
      nos: json['nos'],
      foodType: json['foodType'],
      providerName: json['providerName'],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future getCurrentUserDataFunction() async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .get().then((DocumentSnapshot documentSnapshot) {
  //         if(documentSnapshot.exists){
  //           userModel = UserModel.fromDocument(documentSnapshot);
  //         }
  //         else{
  //           print("Document not in database");
  //         }
  //   });
  // }

  final CollectionReference _foodorder =
      FirebaseFirestore.instance.collection('food');



  // _foodorder.doc('food').get().then((DocumentSnapshot documentSnapshot) {
  //   if (documentSnapshot.exists) {
  //     print('Document data: ${documentSnapshot.data()}');
  //   } else {
  //     print('Document does not exist on the database');
  //   }
  // });
  void dataRead() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('food/f').get();
    print(snapshot);
    print('Data Read');

    Stream<List<User>> readUsers() => FirebaseFirestore.instance
        .collection('food')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

    print(snapshot);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 61, 213, 240),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.purple),
                accountName: Text("NAME"),
                accountEmail: Text("emailaddress@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
              ),
              DrawerItems(
                icon: Icons.person,
                title: Text("Profile"),
              ),
              DrawerItems(
                icon: Icons.add_shopping_cart,
                title: Text("Cart"),
              ),
              DrawerItems(
                icon: Icons.shopping_basket_sharp,
                title: Text("My Order"),
              ),
              DrawerItems(
                icon: Icons.exit_to_app,
                title: Text("Log Out"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 4, 202, 247),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) =>
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPageBuyer())));
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Material(
                elevation: 7,
                shadowColor: Colors.grey[300],
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      filled: true,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
            ),
            ListTile(
              leading: Text(
                'Categories',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Categories(
                    imgdir: 'images/dinner.png',
                    foodname: 'Dinner',
                  ),
                  Categories(imgdir: 'images/lunch.png', foodname: 'Lunch'),
                  Categories(
                      imgdir: 'images/breakfast.png', foodname: 'Breakfast'),
                  Categories(imgdir: 'images/snacks.png', foodname: 'Snack'),
                  Categories(
                      imgdir: 'images/otherfood.png', foodname: 'Other Food'),
                ],
              ),
            ),
            ListTile(
              leading: Text(
                'Products',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza')
                ],
              ),
            ),
            ListTile(
              leading: Text(
                'Best Sells',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza'),
                  SingleProduct(price: 43, name: 'pizza')
                ],
              ),
            ),
            //MapPage(),
            // Container(
            //   height: 100,
            //   child: StreamBuilder(
            //     stream: FirebaseFirestore.instance.collection('food').snapshots(),
            //     builder: (context, AsyncSnapshot<QuerySnapshot> streamsnapshot){
            //       if(!streamsnapshot.hasData){
            //         return Center(child: const CircularProgressIndicator());
            //       }
            //       return ListView.builder(
            //         itemCount: streamsnapshot.data!.docs.length,
            //           itemBuilder: (ctx, index){
            //           print(streamsnapshot.data!.docs[index]["foodName"].toString());
            //               return Container(
            //
            //               );
            //           });
            //   },
            //   ),
            // ),
            MaterialButton(
                onPressed: () {
                  RoutingPage.goToNext(context: context, navigateTo: MapPage());
                },
                color: Colors.red,
                child: Text("Show Map"))
          ],
        ));
  }
}

class SingleProduct extends StatelessWidget {
  SingleProduct({required this.price, required this.name});

  final int price;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 200,
      width: 150,
      color: Color.fromARGB(255, 207, 194, 193),
      child: Column(
        children: [Image(image: NetworkImage('')), Text(name)],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  Categories({required this.imgdir, required this.foodname});

  final String imgdir;
  final String foodname;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 0),
          spreadRadius: -3,
          blurRadius: 15,
          color: Color.fromRGBO(96, 88, 88, 1),
        )
      ], image: DecorationImage(image: AssetImage(imgdir), fit: BoxFit.cover)),
      child: TextButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GradientText(
              '$foodname',
              style: TextStyle(
                backgroundColor: Color.fromARGB(255, 4, 202, 247),
                fontSize: 20.0,
              ),
              colors: [
                Color.fromARGB(255, 171, 211, 250),
                Color.fromARGB(255, 249, 243, 242),
                Color.fromARGB(255, 144, 144, 239),
              ],
            ),
          ],
        ),
      ),
      height: 100,
      width: 170,
    );
  }
}

class DrawerItems extends StatelessWidget {
  DrawerItems({required this.title, required this.icon});

  final Text title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: title,
    );
  }
}
