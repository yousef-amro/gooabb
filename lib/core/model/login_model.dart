import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginModel {
  final GlobalKey<FormState> formField = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "yoyo2007pc@gmail.com" : "",
  );
  final TextEditingController passController = TextEditingController(
    text: kDebugMode ? "12341234" : "",
  );

  LoginModel();

  bool get isValid {
    if (formField.currentState!.validate()) {
      return true;
    }
    return false;
  }

  void clearInputs() {
    emailController.clear();
    passController.clear();
  }
}
