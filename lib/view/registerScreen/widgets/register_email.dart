import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/view/registerScreen/controller/register_cubit.dart';

class RegisterFirstName extends StatelessWidget {
  const RegisterFirstName({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        controller: registerCubit.registerModel.firstNameController,
        textAlign: TextAlign.start,

        validator: (value) {
          if (value!.isEmpty) {
            return 'اسمك';
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

          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
