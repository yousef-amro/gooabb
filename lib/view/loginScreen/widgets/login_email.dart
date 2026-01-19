import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/validatesConstants.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,

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
          hintText: 'user@example.com',
          hintStyle: TextStyle(color: Colors.pink),

          prefixIcon: Icon(Icons.mail_outline, color: Colors.blue),

          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(width: 2, color: Colors.teal),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(width: 2, color: Colors.teal),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              width: 2,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}
