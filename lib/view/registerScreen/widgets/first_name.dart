import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/core/constants/validatesConstants.dart';
import 'package:gooabb/view/registerScreen/controller/register_cubit.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: registerCubit.registerModel.emailController,
        textAlign: TextAlign.start,

        validator: (value) {
          if (value!.isEmpty) {
            return 'البريد الالكتروني';
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
