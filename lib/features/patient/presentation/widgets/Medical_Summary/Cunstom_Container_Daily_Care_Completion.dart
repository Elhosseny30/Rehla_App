import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CunstomContainerDailyCareCompletion extends StatelessWidget {
  const CunstomContainerDailyCareCompletion({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
      margin: EdgeInsets.all(12),
      //margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFCFCFC), Color.fromARGB(255, 255, 240, 249)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.blackColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyColors.mainColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.imagesHeartNotfilled,
                  color: MyColors.mainColor,
                  height: 30,
                  width: 30,
                ),
              ),
              SizedBox(width: 10),
              CustomWelcomeTextWidget(
                text: "Daily Care\nCompletion",
                size: 16,
                fontWeight: FontWeight.w500,
                color: MyColors.mainColor,
              ),
              SizedBox(width: 10),
              CustomWelcomeTextWidget(
                text: "39%",
                size: 38,
                fontWeight: FontWeight.w300,
                color: MyColors.mainColor,
              ),
            ],
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(8),
            value: 0.5,
            minHeight: 8,
            backgroundColor: const Color.fromARGB(255, 255, 199, 218),
            color: MyColors.mainColor,
            //controller: AnimationController,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
