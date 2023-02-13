import 'package:flutter/material.dart';
import 'package:foodonline/pages/login/login_page_buyer.dart';
import 'package:provider/provider.dart';

import '../start/starting_page.dart';
import 'components/signup_auth_provider.dart';

bool changeButton = false;

class SignUpPageSeller extends StatefulWidget {
  const SignUpPageSeller({Key? key}) : super(key: key);

  @override
  State<SignUpPageSeller> createState() => _SignUpPageSellerState();
}

class _SignUpPageSellerState extends State<SignUpPageSeller> {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  get loginAuthProvider => null;

  @override
  Widget build(BuildContext context) {
    SignupAuthSeller signupAuthProvider =
        Provider.of<SignupAuthSeller>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Seller Signup',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 59, 128, 232),
                    )),
                Image.asset('images/login.jpg', height: 200, width: 200),
                SizedBox(height: 10),
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    hintText: 'Full name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      gapPadding: 10,
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                (signupAuthProvider!.loading == false)
                    ? Material(
                        color: Color.fromARGB(255, 33, 201, 198),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 20),
                        child: InkWell(
                          onTap: () {
                            signupAuthProvider.signupValidation(
                                fullName: fullName,
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
                                    'SignUp',
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
                          builder: (context) => LoginPageBuyer()));
                    },
                    child: Text('LOGIN')),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => StartingPage()));
                    },
                    child: Text('STARTING'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
