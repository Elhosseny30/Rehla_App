import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/Custom_Back_Translate_Button.dart';
import 'package:graduationproject/features/auth/presentation/widgets/DotsWidgets.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class InfoDoctorNationalID extends StatelessWidget {
  const InfoDoctorNationalID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: CustomBackTranslateButton(
                          selectedNumber: 1,
                          iconSize: 25,
                          width: 80,
                          height: 50,
                          icon: Icons.arrow_back_ios_new,
                          onTap: () {
                            context.pop();
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: CustomWelcomeTextWidget(
                        fontWeight: FontWeight.w500,
                        color: MyColors.blueColor,

                        text: "New Account",
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomBackTranslateButton(
                        selectedNumber: 1,
                        iconSize: 25,
                        width: 80,
                        height: 50,
                        icon: Icons.translate,
                        // TODO
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              DotsWidget(currentPage: 3, selectedNumber: 1),
              SizedBox(height: 15),
              CustomWelcomeTextWidget(
                text: "some needed info to help",
                size: 18,
                fontWeight: FontWeight.w300,
                color: MyColors.blackColor,
              ),

              CustomWelcomeTextWidget(
                text: "get you verified",
                size: 18,
                fontWeight: FontWeight.w300,
                color: MyColors.blackColor,
              ),

              SizedBox(height: 35),
            ]
          ),
      ),
    );
  }
}
