import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Custom_Each_Popular_post_container.dart';

class CustomPopularPostsContainer extends StatelessWidget {
  const CustomPopularPostsContainer({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffFF48A4), Color(0xffFF85C1)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  CustomWelcomeTextWidget(
                    text: "Popular Posts",
                    size: 24,
                    fontWeight: FontWeight.w500,
                    color: MyColors.whiteColor,
                  ),
                  CustomWelcomeTextWidget(
                    text: "From the community",
                    size: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.whiteColor,
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: CustomWelcomeTextWidget(
                  text: "See more",
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.whiteColor,
                ),
              ),
            ],
          ),
          CustomEachPopularPostContainer(),
          
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
