import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gooabb/core/model/login_model.dart';
import 'package:gooabb/view/loginScreen/controller/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();

  void login(BuildContext context) async {
    if (loginModel.isValid) {
      try {
        emit(LoginLoading());

        emit(LoginSuccess());
        loginModel.clearInputs();
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (_) => const AppScreen()),
        //   (route) => false, // remove everything
        // );
      } catch (e) {
        emit(LoginError(e.toString()));
        print('error login');
      }
    }
  }
}
