import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gooabb/core/datasources/auth.dart';
import 'package:gooabb/core/model/login_model.dart';
import 'package:gooabb/view/loginScreen/controller/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginModel loginModel = LoginModel();

  void login(BuildContext context) async {
    if (loginModel.isValid) {
      try {
        emit(LoginLoading());
        final result = await AuthDataSource.login(
          email: loginModel.emailController.text,
          password: loginModel.passController.text,
        );
        print(result.id);
        print(result.authToken);
        emit(LoginSuccess());
        loginModel.clearInputs();
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (_) => const AppScreen()),
        //   (route) => false, // remove everything
        // );
      } catch (e, s) {
        print("e :$e, s$s");
        emit(LoginError(e.toString()));
        print(e.toString());
      }
    }
  }
}
