import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:gooabb/core/model/register_model.dart';
import 'package:gooabb/view/registerScreen/controller/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterModel registerModel = RegisterModel();

  void register(BuildContext context) async {
    if (registerModel.isValid) {
      try {
        emit(RegisterLoading());
        // final result = await AuthDataSource.register(
        //   email: registerModel.emailController.text,
        //   password: registerModel.passController.text,
        // );
        // print(result.id);
        // print(result.authToken);
        emit(RegisterSuccess());
        registerModel.clearInputs();
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (_) => const AppScreen()),
        //   (route) => false, // remove everything
        // );
      } catch (e, s) {
        print("e :$e, s$s");
        emit(RegisterError(e.toString()));
        print(e.toString());
      }
    }
  }
}
