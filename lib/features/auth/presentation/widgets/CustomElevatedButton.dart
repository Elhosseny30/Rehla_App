import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed, required this.selectedNumber,
  });
  final String text;
  final void Function() onPressed;
  final int? selectedNumber;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.whiteColor,
        minimumSize: Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          side: BorderSide(color:selectedNumber == 1?MyColors.blueColor: MyColors.mainColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selectedNumber == 1?Color(0xff2D69E2): MyColors.mainColor,
          fontSize: 25,
          fontFamily: fontsApp.mainFont,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
