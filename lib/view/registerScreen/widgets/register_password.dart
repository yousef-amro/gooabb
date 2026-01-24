import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/core/constants/colors_constants.dart';
import 'package:gooabb/view/registerScreen/controller/register_cubit.dart';

class RegisterPassword extends StatelessWidget {
  const RegisterPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: registerCubit.registerModel.passController,
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
