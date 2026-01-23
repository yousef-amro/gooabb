import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/core/model/login_model.dart';
import 'package:gooabb/view/loginScreen/components/header_component.dart';
import 'package:gooabb/view/loginScreen/components/new_account_component.dart';
import 'package:gooabb/view/loginScreen/components/text_fields_component.dart';
import 'package:gooabb/view/loginScreen/controller/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit loginCubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginCubit,
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: loginCubit.loginModel.formField,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderComponent(),
                    const SizedBox(height: 20),
                    TextFieldsComponent(),
                    const SizedBox(height: 10),
                    NewAccountComponent(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
