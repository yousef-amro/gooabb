import 'package:flutter/material.dart';
import 'package:gooabb/core/constants/imagesConstants.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({super.key});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [Image.asset(assets.logo)]);
  }
}
