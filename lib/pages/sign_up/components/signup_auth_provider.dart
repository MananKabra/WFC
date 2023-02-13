import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodonline/pages/seller_order/seller_intro_page.dart';
import 'package:foodonline/pages/seller_order/seller_order_details.dart';

import '../../home/home_page.dart';

class SignupAuthSeller with ChangeNotifier {
  UserCredential? userCredential;
  bool loading = false;

  void signupValidation(
      {required TextEditingController? fullName,
      required TextEditingController? emailAddress,
      required TextEditingController? password,
      required BuildContext context}) async {
    if (fullName!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Full name is Empty")));
      return;
    } else if (emailAddress!.text.trim().isEmpty) {
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
            .createUserWithEmailAndPassword(
                email: emailAddress.text, password: password.text);

        loading = true;
        notifyListeners();

        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential!.user!.uid)
            .set(
          {
            "Fullname": fullName.text,
            "emailAddress": emailAddress.text,
            "password": password.text,
            "userUID": userCredential!.user!.uid
          },
        ).then((value) {
          loading = false;
          notifyListeners();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SellerIntro(),
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();

        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("weak-password"),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("email-already-in-use"),
            ),
          );
        }
      }
    }
  }
}
