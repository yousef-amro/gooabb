import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/core/constants/colors_constants.dart';
import 'package:gooabb/view/loginScreen/components/header_component.dart';
import 'package:gooabb/view/registerScreen/components/text_fields_component.dart';
import 'package:gooabb/view/registerScreen/controller/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit registerCubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerCubit,
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: registerCubit.registerModel.formField,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    HeaderComponent(),
                    RegisterTextFieldsComponent(),
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
