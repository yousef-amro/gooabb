import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginModel {
  final GlobalKey<FormState> formField = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "amrelswaf48118@gmail.com" : "",
  );
  final TextEditingController passController = TextEditingController(
    text: kDebugMode ? "Amr44wr2*" : "",
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
