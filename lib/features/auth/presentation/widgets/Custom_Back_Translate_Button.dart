import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomBackTranslateButton extends StatelessWidget {
  const CustomBackTranslateButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.width,
    required this.height,
    required this.iconSize,required this.selectedNumber,
  });
  final IconData icon;
  final void Function() onTap;
  final double width;
  final double height;
  final double iconSize;
  final int? selectedNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO:
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Icon(
          icon,
          fontWeight: FontWeight.w400,
          size: iconSize,
          color:selectedNumber==1?MyColors.blueColor: MyColors.mainColor,
        ),
      ),
    );
  }
}
