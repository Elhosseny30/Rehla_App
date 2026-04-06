import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/imagesAssets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({
    super.key,
    required this.title,
    required this.textOne,
    required this.textTwo,
    required this.isSelected,
    required this.selectedNumber,
    required this.eachIcon,
  });
  final String title;
  final String textOne;
  final String textTwo;
  final bool isSelected;
  final int? selectedNumber;
  final int eachIcon;
  @override
  Widget build(BuildContext context) {
    final Color currentColor = (selectedNumber == 1 && isSelected)
        ? MyColors.blueColor
        : (selectedNumber == 2 && isSelected)
        ? MyColors.greenColor
        : isSelected
        ? MyColors.mainColor
        : MyColors.greyRegisterColorContainer;
    return Container(
      height: 176,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: currentColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            if (eachIcon == 0) ...[
              SvgPicture.asset(
                Assets.healthRibbonIcon,
                color: selectedNumber == 0 ? MyColors.mainColor : null,
              ),
            ] else if (eachIcon == 1) ...[
              SvgPicture.asset(
                Assets.imagesPlusIcon,
                color: selectedNumber == 1 ? MyColors.blueColor : null,
              ),
            ] else if (eachIcon == 2) ...[
              SvgPicture.asset(
                Assets.imagesHeartIcon,
                color: selectedNumber == 2 ? MyColors.greenColor : null,
              ),
            ],

            const SizedBox(height: 5),
            CustomWelcomeTextWidget(
              text: title,
              size: 30,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            const SizedBox(height: 5),
            CustomWelcomeTextWidget(
              text: textOne,
              size: 24,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: CustomWelcomeTextWidget(
                text: textTwo,
                size: 24,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
