import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomRowUpcomingSeeAll extends StatelessWidget {
  const CustomRowUpcomingSeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CustomWelcomeTextWidget(
            text: "Upcoming Events",
            size: 25,
            fontWeight: FontWeight.w500,
            color: MyColors.blackColor,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
            onTap: () {},
            child: CustomWelcomeTextWidget(
              text: "See all",
              size: 23,
              fontWeight: FontWeight.w500,
              color: MyColors.mainColor,
            ),
          ),
        ),
      ],
    );
  }
}
