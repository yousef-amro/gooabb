import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 110, right: 110),
      child: Container(
        child: RawMaterialButton(
          fillColor: Color(0xffFFD600),
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
