import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colors_constants.dart';
import 'package:gooabb/view/loginScreen/widgets/support_button.dart';
import 'package:gooabb/view/registerScreen/view.dart';

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
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreen(),
                    ),
                    (route) => false, // remove everything
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
          onTap: () => openSupportEmail(context),
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
