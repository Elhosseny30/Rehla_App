import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomTranslateButton extends StatelessWidget {
  const CustomTranslateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO:
      onTap: (){},
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          alignment: Alignment.center,
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Icon(
            Icons.translate,
            fontWeight: FontWeight.w400,
            size: 35,
            color: MyColors.mainColor,
          ),
        ),
      ),
    );
  }
}
