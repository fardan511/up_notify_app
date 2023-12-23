import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginError {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: "Email doesn't exist or Invalid Password",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
