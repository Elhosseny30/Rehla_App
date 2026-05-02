import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomOneContainerMDSL extends StatelessWidget {
  const CustomOneContainerMDSL({
    super.key,
    required this.imagePath,
    required this.textOne,
    this.textTwo,
  });
  final String imagePath;
  final String textOne;
  final String? textTwo;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: MyColors.babyPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
              
                imagePath,
                
                fit: BoxFit.contain,
              ),
            ),
          ),
          CustomWelcomeTextWidget(
            text: textOne,
            size: 18,
            fontWeight: FontWeight.w400,
            color: MyColors.blackColor,
          ),
          CustomWelcomeTextWidget(
            text: textTwo ?? "",
            size: 18,
            fontWeight: FontWeight.w400,
            color: MyColors.blackColor,
          ),
        ],
      ),
    );
  }
}
