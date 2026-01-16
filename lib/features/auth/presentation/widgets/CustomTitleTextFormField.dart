import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomTitleTextFormField extends StatelessWidget {
  const CustomTitleTextFormField({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: fontsApp.mainFont,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }
}
