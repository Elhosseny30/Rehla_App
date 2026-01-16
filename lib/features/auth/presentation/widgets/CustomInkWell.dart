import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({super.key, required this.text,required this.onTap});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: fontsApp.mainFont,
            fontWeight: FontWeight.w300,
            fontSize: 14,
            color: MyColors.mainColor,
          ),
        ),
      ),
    );
  }
}
