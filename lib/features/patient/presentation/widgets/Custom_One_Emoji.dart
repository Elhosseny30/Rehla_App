import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomOneEmoji extends StatelessWidget {
  CustomOneEmoji({super.key, required this.emojiPath,});
  final String emojiPath;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: MyColors.mainColor,
      radius: 28,
      child: CircleAvatar(
        backgroundColor: MyColors.whiteColor,
        radius: 27,
        child: Image.asset(emojiPath, width: 35, height: 35),
      ),
    );
  }
}
