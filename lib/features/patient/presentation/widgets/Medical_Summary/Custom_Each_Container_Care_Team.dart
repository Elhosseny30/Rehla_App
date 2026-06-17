import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomEachContainerCareTeam extends StatelessWidget {
  const CustomEachContainerCareTeam({super.key,required this.textOne,required this.textTwo});
  final String textOne;
  final String textTwo;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          child: SvgPicture.asset(Assets.imagesPerson, height: 45, width: 45),
        ),
        CustomWelcomeTextWidget(
          text: textOne,
          size: 18,
          fontWeight: FontWeight.w400,
          color: MyColors.blackColor,
        ),
        CustomWelcomeTextWidget(
          text: textTwo,
          size: 11,
          fontWeight: FontWeight.w400,
          color: MyColors.blackColor,
        ),
      ],
    );
  }
}
