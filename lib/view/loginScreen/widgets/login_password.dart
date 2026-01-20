import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/core/constants/validatesConstants.dart';

class LoginPassword extends StatelessWidget {
  const LoginPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Color(0xffFFD600),
            height: 40,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              color: Color(0xff1E1E1E),
              height: 35,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              textAlign: TextAlign.center,
              obscureText: true,

              validator: (value) {
                if (value!.isEmpty) {
                  return 'البريد الالكتروني:';
                }
                bool emailValid = RegExp(
                  Validates.email,
                ).hasMatch(value);
                if (!emailValid) {
                  return "Enter Valid Email";
                }
                return null;
              },

              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                hintText: 'Your Password',
                hintStyle: TextStyle(
                  color: AppColors.hintText,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 3,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
