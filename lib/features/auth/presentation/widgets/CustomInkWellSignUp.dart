import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomInkWellSignUp extends StatelessWidget {
  const CustomInkWellSignUp({super.key, required this.text,required this.onTap});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: MyColors.mainColor,
        ),
      ),
    );
  }
}
