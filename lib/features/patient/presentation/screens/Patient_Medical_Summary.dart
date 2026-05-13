import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Cunstom_Container_Daily_Care_Completion.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Custom_Container_App_Bar_Medical_Summary.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Custom_Medical_Summary_container.dart';

class PatientMedicalSummary extends StatelessWidget {
  const PatientMedicalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    print("Medical");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomContainerAppBarMedicalSummary(),
                SizedBox(height: 15),
                CustomMedicalSummaryContainer(),
                SizedBox(height: 10),
                CunstomContainerDailyCareCompletion(),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColors.whiteColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: MyColors.blackColor.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWelcomeTextWidget(
                              text: "Medicataion",
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: MyColors.mainColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "Next dose",
                              size: 16,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blackColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "02:30 pm",
                              size: 16,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blackColor,
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: MyColors.babyPink,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.images7abaia,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: MyColors.babyPink,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.imagesTelegram,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        // margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColors.whiteColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: MyColors.blackColor.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWelcomeTextWidget(
                              text: "Nutrition",
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: MyColors.mainColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "View today's",
                              size: 16,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blackColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "diet plan",
                              size: 16,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blackColor,
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: MyColors.babyPink,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.imagesFoodHeat,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: MyColors.babyPink,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.imagesTelegram,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: MyColors.whiteColor,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: MyColors.blackColor.withOpacity(0.1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWelcomeTextWidget(
                              text: "Daily check",
                              size: 18,
                              fontWeight: FontWeight.w400,
                              color: MyColors.mainColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "Log your",
                              size: 16,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blackColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "symptoms",
                              size: 16,
                              fontWeight: FontWeight.w300,
                              color: MyColors.blackColor,
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: MyColors.babyPink,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: SvgPicture.asset(
                                      Assets.imagesFlower,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: MyColors.babyPink,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.imagesTelegram,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
