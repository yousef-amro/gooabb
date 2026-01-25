import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gooabb/core/constants/colors_constants.dart';
import 'package:gooabb/view/registerScreen/controller/register_cubit.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();
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
          onPressed: () {
            registerCubit.register(context);
          },
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
                "تسجيل حساب جديد",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
