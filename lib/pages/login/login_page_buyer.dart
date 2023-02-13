import 'package:flutter/material.dart';
import 'package:foodonline/pages/sign_up/components/login_auth_provider.dart';
import 'package:foodonline/pages/sign_up/signup_page_seller.dart';
import 'package:provider/provider.dart';

import '../sign_up/signup_page_buyer.dart';
import '../start/starting_page.dart';
import 'package:foodonline/pages/sign_up/components/login_auth_buyer.dart';

class LoginPageBuyer extends StatelessWidget {
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    LoginAuthBuyer loginAuthBuyer = Provider.of<LoginAuthBuyer>(context);

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
                  Text('Eat the Food, bless the good',
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
                  (loginAuthBuyer.loading == false)
                      ? Material(
                          color: Color.fromARGB(255, 33, 201, 198),
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 20),
                          elevation: 50,
                          shadowColor: Color.fromARGB(255, 20, 21, 21),
                          child: InkWell(
                            onTap: () {
                              loginAuthBuyer.loginValidation(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 76, 87, 87),
                            elevation: null,
                            fixedSize: Size(70, 15),
                            primary: Color.fromARGB(255, 53, 54, 54),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpPageBuyer()));
                          },
                          child: Text(
                            'SIGN-UP',
                            style: TextStyle(
                                color: Color.fromARGB(255, 224, 235, 234),
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(height: 40),
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
