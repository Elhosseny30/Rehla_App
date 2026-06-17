import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomContainerCommunityAppBar extends StatelessWidget {
  const CustomContainerCommunityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  SizedBox(width: 8),
                  CustomWelcomeTextWidget(
                    text: "Community",
                    size: 24,
                    fontWeight: FontWeight.w500,
                    color: MyColors.mainColor,
                  ),
                  Spacer(),
                  SvgPicture.asset(Assets.imagesSerach, height: 40, width: 40),
                  SizedBox(width: 8),
                  SvgPicture.asset(Assets.imagesChat, height: 50, width: 50),
                  SizedBox(width: 8),
                  SvgPicture.asset(Assets.imagesBell, height: 50, width: 50),
                ],
              ),
            );
  }
}