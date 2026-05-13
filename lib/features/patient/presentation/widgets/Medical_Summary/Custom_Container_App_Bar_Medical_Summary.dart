import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomContainerAppBarMedicalSummary extends StatelessWidget {
  const CustomContainerAppBarMedicalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              child: SvgPicture.asset(
                Assets.imagesPerson,
                height: 45,
                width: 45,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomWelcomeTextWidget(
                  text: "Basma's care",
                  size: 20,
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainColor,
                ),
                CustomWelcomeTextWidget(
                  text: "3 daily tasks",
                  size: 12,
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainColor,
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset(Assets.imagesChat, height: 50, width: 50),
            SvgPicture.asset(Assets.imagesBell, height: 50, width: 50),
          ],
        ),
      ),
    );
  }
}
