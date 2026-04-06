import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomInkWellSignUp extends StatelessWidget {
  const CustomInkWellSignUp({
    super.key,
    required this.text,
    required this.onTap,
    required this.selectedNumber,
  });
  final String text;
  final void Function() onTap;
  final int? selectedNumber;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: selectedNumber == 1
              ? MyColors.blueColor
              : selectedNumber == 2
              ? MyColors.greenColor
              : MyColors.mainColor,
        ),
      ),
    );
  }
}
