import 'package:flutter/material.dart';
import 'package:foodonline/pages/seller_order/seller_order_details.dart';
import 'package:foodonline/pages/sign_up/components/login_auth_provider.dart';
import 'package:foodonline/pages/sign_up/signup_page_seller.dart';
import 'package:provider/provider.dart';

import '../start/starting_page.dart';

class LoginPageSeller extends StatelessWidget {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome Back',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 21, 223, 206))),
                  Text('Feed the hungry, bless the soul',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 128, 255))),
                  Image.asset(
                    'images/login.jpg',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                  TextFormField(
                    controller: emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      labelText: "Email Address",
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 21, 223, 206),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 21, 223, 206),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(height: 20),
                  (loginAuthProvider.loading == false)
                      ? Material(
                          color: Color.fromARGB(255, 33, 201, 198),
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 20),
                          child: InkWell(
                            onTap: () {
                              loginAuthProvider.loginValidation(
                                  emailAddress: emailAddress,
                                  password: password,
                                  context: context);
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 50 : 150,
                              height: 40,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                  SizedBox(height: 20),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPageSeller()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? SIGNUP'),
                        ],
                      )),
                  SizedBox(height: 20),
                  GestureDetector(

                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StartingPage()));
                    },
                    child: Text('Choose account type?',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 21, 223, 206))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
