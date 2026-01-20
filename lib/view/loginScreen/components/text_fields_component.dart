import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/view/loginScreen/widgets/login_button.dart';
import 'package:gooabb/view/loginScreen/widgets/login_email.dart';
import 'package:gooabb/view/loginScreen/widgets/login_password.dart';

class TextFieldsComponent extends StatefulWidget {
  const TextFieldsComponent({super.key});

  @override
  State<TextFieldsComponent> createState() =>
      _TextFieldsComponentState();
}

class _TextFieldsComponentState extends State<TextFieldsComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: Alignment.center, // ✅ ده المفتاح
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Color(0xffFFD600),
                height: 300,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  color: Color(0xff1E1E1E),
                  height: 295,
                  width: double.infinity,
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ':البريد الالكتروني',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 10),
              LoginEmail(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ':كلمة المرور',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 10),
              LoginPassword(),
              SizedBox(height: 10),
              LoginButton(),
            ],
          ),
        ],
      ),
    );
  }
}
