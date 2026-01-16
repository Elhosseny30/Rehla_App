import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomWelcomeTextWidget extends StatelessWidget {
  const CustomWelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome Home",
        style: TextStyle(
          fontFamily: fontsApp.mainFont,
          fontWeight: FontWeight.w500,
          fontSize: 30,
          color: MyColors.mainColor,
        ),
      ),
    );
  }
}
