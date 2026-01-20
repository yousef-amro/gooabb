import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.gooabbYellow,
          borderRadius: BorderRadius.circular(19),
        ),
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(),
          elevation: 0,
          onPressed: () {},
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Center(
              child: Text(
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                "تسجيل دخول",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
