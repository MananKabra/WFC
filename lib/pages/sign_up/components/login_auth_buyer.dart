import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodonline/pages/bottombar/bottom_nav.dart';
import 'package:foodonline/pages/home/home_page.dart';
import 'package:foodonline/pages/seller_order/seller_order_details.dart';

class LoginAuthBuyer with ChangeNotifier {
  UserCredential? userCredential;
  bool loading = false;

  void loginValidation(
      {required TextEditingController? emailAddress,
      required TextEditingController? password,
      required BuildContext context}) async {
    if (emailAddress!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email Address is Empty")));
      return;
    } else if (password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password is Empty")));
      return;
    } else {
      try {
        loading = true;
        notifyListeners();

        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailAddress.text, password: password.text)
            .then((value) async {
          loading = false;
          notifyListeners();
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => bottomnav()));
        });
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();

        if (e.code == "user-not-found") {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("user-not-found")));
        } else if (e.code == "wrong-password") {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("wrong-password")));
        }
      }
    }
  }
}
