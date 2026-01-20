import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colorsConstants.dart';
import 'package:gooabb/view/loginScreen/widgets/support_button.dart';
import 'package:gooabb/view/registerScreen/view.dart';
import 'package:url_launcher/url_launcher.dart';

class NewAccountComponent extends StatefulWidget {
  const NewAccountComponent({super.key});

  @override
  State<NewAccountComponent> createState() =>
      _NewAccountComponentState();
}

class _NewAccountComponentState extends State<NewAccountComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                });
              },
              child: Text(
                'انشاء حساب جديد',
                style: TextStyle(
                  color: AppColors.gooabbYellow,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              'ليس لديك حساب؟',
              style: TextStyle(color: AppColors.white),
            ),
          ],
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: openSupportEmail,
          child: Text(
            'التواصل مع الدعم؟',
            style: TextStyle(
              color: AppColors.gooabbYellow,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
