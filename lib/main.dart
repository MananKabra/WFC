import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodonline/pages/home/home_page.dart';
import 'package:foodonline/pages/map.dart';
import 'package:foodonline/pages/sign_up/components/login_auth_provider.dart';
import 'package:foodonline/pages/sign_up/components/seller_auth_order.dart';
import 'package:foodonline/pages/sign_up/components/signup_auth_buyer.dart';
import 'package:foodonline/pages/sign_up/components/signup_auth_provider.dart';
import 'package:foodonline/pages/start/starting_page.dart';
import 'package:provider/provider.dart';
import 'pages/welcome/welcome_page.dart';
import 'pages/sign_up/signup_page_seller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodonline/pages/sign_up/components/login_auth_buyer.dart';

// import 'package:foodonline/pages/sign_up/components/signup_auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //runApp(const MyApp());
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthSeller(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthBuyer(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupAuthBuyer(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return HomePage();
            }
            return StartingPage();
          },
        ),
      ),
    );
  }
}
