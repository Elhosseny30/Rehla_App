import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class Donate extends StatelessWidget {
  const Donate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
      margin: EdgeInsets.only(right: 100),
      alignment: Alignment.topLeft,
      //margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.blackColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomWelcomeTextWidget(
            text: "Support the Journey",
            size: 24,
            fontWeight: FontWeight.w400,
            color: MyColors.mainColor,
          ),
          CustomWelcomeTextWidget(
            text: "Help breast cancer foundations",
            size: 18,
            fontWeight: FontWeight.w300,
            color: MyColors.blackColor,
          ),
          CustomWelcomeTextWidget(
            text: "make a difference",
            size: 18,
            fontWeight: FontWeight.w300,
            color: MyColors.blackColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesRehlaLogomarkPNG, height: 30, width: 30),
              TextButton(
                onPressed: () {},
                child: CustomWelcomeTextWidget(
                  text: "Donate now",
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: MyColors.mainColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
