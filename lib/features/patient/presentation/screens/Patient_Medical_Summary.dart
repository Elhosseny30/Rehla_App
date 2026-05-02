import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Container_Medicine_Diet_Session_Lookout.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_All_Emojis.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_App_Bar.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_Popular_Posts_Container.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Donate.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Row_Upcoming_See_All.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Uncoming_Events.dart';

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
                Container(
                  padding: EdgeInsets.only(bottom: 12, top: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: MyColors.whiteColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                  ),
                  child: SafeArea(
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

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWelcomeTextWidget(
                              text: "Basma's care",
                              size: 20,
                              fontWeight: FontWeight.w500,
                              color: MyColors.mainColor,
                            ),
                            CustomWelcomeTextWidget(
                              text: "3 daily tasks",
                              size: 12,
                              fontWeight: FontWeight.w500,
                              color: MyColors.mainColor,
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          Assets.imagesChat,
                          height: 50,
                          width: 50,
                        ),
                        SvgPicture.asset(
                          Assets.imagesBell,
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
