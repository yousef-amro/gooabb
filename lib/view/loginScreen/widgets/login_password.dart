import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/view/loginScreen/controller/login_cubit.dart';

class LoginPassword extends StatelessWidget {
  const LoginPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = context.read<LoginCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: cubit.loginModel.passController,
        textAlign: TextAlign.start,
        obscureText: true,

        validator: (value) {
          if (value == null || value.isEmpty) return "Enter Password";
          if (value.length < 6) {
            return "Password Length Should be more than 6 characters";
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
          hintText: 'Your Password',
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
