import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

final product = <String, String>{
  "name": "Randh",
  "price": "90",
};

final city = <String, String>{
  "name": "Los Angeles",
  "state": "CA",
  "country": "USA"
};

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CollectionReference _products = 
      FirebaseFirestore.instance.collection('product');
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

