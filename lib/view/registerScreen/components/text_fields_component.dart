import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/view/registerScreen/widgets/age.dart';
import 'package:gooabb/view/registerScreen/widgets/first_name.dart';
import 'package:gooabb/view/registerScreen/widgets/register_email.dart';
import 'package:gooabb/view/registerScreen/widgets/register_password.dart';
import 'package:gooabb/view/registerScreen/widgets/second_name.dart';

class RegisterTextFieldsComponent extends StatefulWidget {
  const RegisterTextFieldsComponent({super.key});

  @override
  State<RegisterTextFieldsComponent> createState() =>
      _RegisterTextFieldsComponentState();
}

class _RegisterTextFieldsComponentState
    extends State<RegisterTextFieldsComponent> {
  DateTime _selected = DateTime(2000, 1, 1);

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
                  height: 800,
                  width: double.infinity,
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0)),
            ],
          ),
          Column(
            children: [
              Text(
                'انشاء حساب جديد',
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
                    'اسمك',
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
              RegisterFirstName(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'اسم العائلة',
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
              RegisterSecondName(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'تاريخ الميلاد',
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
              DatePickerTextField(
                labelText: 'Birthday',
                hintText: 'DD/MM/YYYY',
                minYear: 1950,
                maxYear: DateTime.now().year,
                onChanged: (date) {
                  // Save date
                  print(date);
                },
              ),

              SizedBox(height: 15),
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
              RegisterEmail(),
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
              RegisterPassword(),

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
              RegisterFirstName(),
            ],
          ),
        ],
      ),
    );
  }
}
