import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_One_Container_M_D_S_L.dart';

class CustomContainerMedicineDietSessionLookout extends StatelessWidget {
  const CustomContainerMedicineDietSessionLookout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),

      decoration: BoxDecoration(
        color: MyColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border:Border.all(
          color:MyColors.blackColor.withOpacity(0.1),
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomOneContainerMDSL(
              imagePath: Assets.images7abaia,
              textOne: "Medicine",
              textTwo: "02:00",
            ),
        
            CustomOneContainerMDSL(
              imagePath: Assets.imagesEat,
              textOne: "Diet Plan",
              textTwo: "view",
            ),
        
            CustomOneContainerMDSL(
              imagePath: Assets.imagesSomeBody,
              textOne: "Session",
              textTwo: "02:00",
            ),
        
            CustomOneContainerMDSL(
              imagePath: Assets.imagesLookout,
              textOne: "Lookout",
            ),
          ],
        ),
      ),
    );
  }
}
