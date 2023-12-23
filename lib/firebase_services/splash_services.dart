import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/login_page.dart';
import 'package:project/post_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    // ignore: unused_local_variable
    final auth = FirebaseAuth.instance;

    // ignore: unused_local_variable
    final user = auth.currentUser;

    if (user != null) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PostScreen())),
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage())),
      );
    }
  }
}
