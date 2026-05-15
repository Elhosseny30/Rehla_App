import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomChatBotFastMessage extends StatelessWidget {
  const CustomChatBotFastMessage({super.key, required this.messege});
  final String messege;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.blurPink,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {
          print("$messege");
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          // الـ padding الداخلي اللي كان في الـ Container
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: CustomWelcomeTextWidget(
            text: messege,
            size: 16,
            fontWeight: FontWeight.w400,
            color: MyColors.blackColor,
          ),
        ),
      ),
    );
  }
}
