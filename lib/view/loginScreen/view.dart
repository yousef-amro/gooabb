import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/view/loginScreen/components/header_component.dart';
import 'package:gooabb/view/loginScreen/components/new_account_component.dart';
import 'package:gooabb/view/loginScreen/components/text_fields_component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
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
    );
  }
}
