import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Custom_Each_Container_Care_Team.dart';

class CustomContainerCareTeam extends StatelessWidget {
  const CustomContainerCareTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomWelcomeTextWidget(
                            text: "Your Care Team",
                            size: 24,
                            fontWeight: FontWeight.w500,
                            color: MyColors.mainColor,
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz,
                              color: MyColors.mainColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          CustomEachContainerCareTeam(
                            textOne: "Dr Atef",
                            textTwo: "Oncologist full access",
                          ),
                          Spacer(),
                          CustomEachContainerCareTeam(
                            textOne: "Mona Fawzy",
                            textTwo: "Nutritionist Mixed access",
                          ),
                          Spacer(),
                          CustomEachContainerCareTeam(
                            textOne: "Dr Ahmed",
                            textTwo: "Oncologist Mixed access",
                          ),
                        ],
                      ),
                      SizedBox(height: 18),
                      Divider(
                        color: MyColors.greyRegisterColorContainer,

                        endIndent: 10,
                        indent: 10,
                      ),

                      TextButton(
                        onPressed: () {},
                        child: CustomWelcomeTextWidget(
                          text: "Manage team",
                          size: 18,
                          fontWeight: FontWeight.w400,
                          color: MyColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                );
  }
}