import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomMedicalSummaryContainer extends StatelessWidget {
  const CustomMedicalSummaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
      margin: EdgeInsets.all(12),
      //margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MyColors.blackColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomWelcomeTextWidget(
                text: "Medical Summary",
                size: 24,
                fontWeight: FontWeight.w500,
                color: MyColors.mainColor,
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.more_horiz,
                  color: MyColors.mainColor, // اللون الوردي بتاعك
                  size: 30,
                ),
              ),
            ],
          ),
          CustomWelcomeTextWidget(
            text: "Undergoing treatment",
            size: 18,
            fontWeight: FontWeight.w300,
            color: MyColors.blackColor,
          ),
          CustomWelcomeTextWidget(
            text: "Chemotherapy . Cycle 3",
            size: 18,
            fontWeight: FontWeight.w300,
            color: MyColors.blackColor,
          ),
          CustomWelcomeTextWidget(
            text: "Updated by Dr Ahmed-May 01,2025",
            size: 18,
            fontWeight: FontWeight.w300,
            color: MyColors.blackColor,
          ),
          SizedBox(height: 10),
          Divider(thickness: 0.5),
          Row(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {},
                child: CustomWelcomeTextWidget(
                  text: "Full medical info",
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainColor,
                ),
              ),
              Spacer(),
              SizedBox(height: 30, child: VerticalDivider(thickness: 0.5)),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: CustomWelcomeTextWidget(
                  text: "My documents",
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.mainColor,
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
