import 'package:flutter/material.dart';
import 'package:foodonline/pages/login/login_page_buyer.dart';
import 'package:foodonline/pages/sign_up/signup_page_seller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>LoginPageBuyer())
                  );
            },
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(04)
              ),
                color: Colors.red,
              child: Text(
                'LOGIN'
              )
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>SignUpPageSeller())
                );
              },
              child: Text(
                'Sign-in'
              ),
            )
          ],
        ),
      ),
    );
  }
}
