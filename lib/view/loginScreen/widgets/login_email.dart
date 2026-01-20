import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/core/constants/validatesConstants.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        textAlign: TextAlign.start,
        obscureText: true,

        validator: (value) {
          if (value!.isEmpty) {
            return 'البريد الالكتروني:';
          }
          bool emailValid = RegExp(Validates.email).hasMatch(value);
          if (!emailValid) {
            return "Enter Valid Email";
          }
          return null;
        },

        decoration: InputDecoration(
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(19),
            borderSide: BorderSide.none,
          ),
          hintText: 'user@example.com',
          hintStyle: TextStyle(
            color: AppColors.hintText,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),

          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
