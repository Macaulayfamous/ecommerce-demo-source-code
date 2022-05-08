import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/bottom_menu.dart';
import 'package:flutter_ecommerce/screens/landing_page.dart';

class UserState extends StatelessWidget {
  const UserState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapShot) {
        if (userSnapShot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (userSnapShot.connectionState == ConnectionState.active) {
          if (userSnapShot.hasData) {
            return BottomMenu();
          } else {
            return LandingPage();
          }
        } else if (userSnapShot.hasError) {
          return Center(
            child: Text('error occured'),
          );
        }
        return Center(
          child: Text('error'),
        );
      },
    );
  }
}
