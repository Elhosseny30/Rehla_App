import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text,required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.whiteColor,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyColors.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: MyColors.mainColor,
          fontSize: 25,
          fontFamily: fontsApp.mainFont,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
