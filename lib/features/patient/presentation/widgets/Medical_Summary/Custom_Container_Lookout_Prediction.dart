import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomContainerLookoutPrediction extends StatelessWidget {
  const CustomContainerLookoutPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.0, 1.0],
          colors: [const Color(0xFFFFFFFF), const Color(0xFFFFD6EC)],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CustomWelcomeTextWidget(
                text: "Lookout prediction",
                size: 24,
                fontWeight: FontWeight.w500,
                color: MyColors.mainColor,
              ),
              CustomWelcomeTextWidget(
                text: "last check: -- months ago",
                size: 18,
                fontWeight: FontWeight.w500,
                color: MyColors.mainColor,
              ),
              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [0.0, 1.0],
                        colors: [
                          const Color(0xFFFF48A4), // أبيض خالص
                          const Color(
                            0xFFA865FF,
                          ), // بمبي فاتح جداً solid بدون opacity
                        ],
                      ),
                    ),
                    child: CustomWelcomeTextWidget(
                      text: "Run new lookout",
                      size: 14,
                      fontWeight: FontWeight.w400,

                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  // الزرار التاني - outlined
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white.withOpacity(0.6),
                      border: Border.all(
                        color: Color(0xFFFF48A4).withOpacity(0.4),
                        width: 1,
                      ),
                    ),
                    child: CustomWelcomeTextWidget(
                      text: "View history",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(Assets.imagesLookoutSolid),
        ],
      ),
    );
  }
}
