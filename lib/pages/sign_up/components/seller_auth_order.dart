import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodonline/pages/seller_order/seller_order_details.dart';

import '../../home/home_page.dart';

class SignupAuthProvider with ChangeNotifier {
  UserCredential? userCredential;
  bool loading = false;

  void sellerOrderValidation(
      {required TextEditingController? foodName,
      required TextEditingController? foodPrice,
      required TextEditingController? nos,
      required String foodType,
      required BuildContext context}) async {
    if (foodName!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Food Name is Empty")));
      return;
    } else if (foodPrice!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Foor Price is Empty")));
      return;
    } else if (nos!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Quantity is Empty")));
      return;
    } else if (foodType! == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Food Type is Empty")));
      return;
    } else {
      try {
        loading = true;
        notifyListeners();
        // userCredential = await FirebaseAuth.instance
        //     .createUserWithEmailAndPassword();

        loading = true;
        notifyListeners();

        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential!.user!.uid)
            .set(
          {
            // "Fullname": fullName.text,
            // "emailAddress": emailAddress.text,
            // "password": password.text,
            // "userUID": userCredential!.user!.uid
          },
        ).then((value) {
          loading = false;
          notifyListeners();

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SellerOrderDetails(),
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
