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
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 40, 40, 40),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 450,
                  width: double.infinity,
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
            ],
          ),
          Column(
            children: [
              Text(
                'تسجيل دخول',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'البريد الالكتروني',
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
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'كلمة المرور',
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print('yoyo');
                      });
                    },
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: TextStyle(
                        color: AppColors.gooabbYellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                ],
              ),
              SizedBox(height: 25),
              LoginButton(),
            ],
          ),
        ],
      ),
    );
  }
}
