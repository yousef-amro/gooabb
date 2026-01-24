import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterModel {
  final GlobalKey<FormState> formField = GlobalKey<FormState>();
  final TextEditingController firstNameController =
      TextEditingController(text: kDebugMode ? "yousef" : "");
  final TextEditingController secondNameController =
      TextEditingController(text: kDebugMode ? "amr" : "");
  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? "yousefamroacc@gmail.com" : "",
  );
  final TextEditingController passController = TextEditingController(
    text: kDebugMode ? "yousef123456" : "",
  );

  RegisterModel();

  bool get isValid {
    if (formField.currentState!.validate()) {
      return true;
    }
    return false;
  }

  void clearInputs() {
    emailController.clear();
    passController.clear();
    firstNameController.clear();
    secondNameController.clear();
  }
}
