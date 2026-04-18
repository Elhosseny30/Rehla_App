import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Custom_One_Emoji.dart';

class CustomAllEmojis extends StatelessWidget {
  const CustomAllEmojis({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomWelcomeTextWidget(
            text: "How are you feeling today?",
            size: 18,
            fontWeight: FontWeight.w400,
            color: MyColors.mainColor,
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOneEmoji(emojiPath: Assets.imagesHappy,),
              SizedBox(width: 10),
              CustomOneEmoji(emojiPath: Assets.imagesRelaxed,),
              SizedBox(width: 10),
              CustomOneEmoji(emojiPath: Assets.imagesTired,),
              SizedBox(width: 10),
              CustomOneEmoji(emojiPath: Assets.imagesWorried,),
              SizedBox(width: 10),
              CustomOneEmoji(emojiPath: Assets.imagesLookingForSupport,),
            ],
          ),
        ],
      ),
    );
  }
}
