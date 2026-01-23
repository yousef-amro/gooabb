import 'package:flutter/material.dart';
import 'package:gooabb/core/network_utils/network_utils.dart';
import 'package:gooabb/view/splashScreen/view.dart';

void main() async {
  await NetworkUtils.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
