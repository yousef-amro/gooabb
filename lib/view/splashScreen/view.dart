import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/colors_constants.dart';
import 'package:gooabb/core/constants/images_constants.dart';
import 'package:gooabb/view/loginScreen/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      body: Center(child: Image(image: AssetImage(assets.logo))),
    );
  }
}
