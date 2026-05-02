import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/patient/model/upcomingEvents.dart';

class UncomingEvents extends StatelessWidget {
  UncomingEvents({super.key});
  final List<UncomingEventsModel> uncomingEventsModelList = [

    UncomingEventsModel(
      text: "Survivors support group",
      image: Assets.imagesSupportGroup,
      date: "Thursday, 12/5",
    ),
    UncomingEventsModel(
      text: "Mental health session",
      image: Assets.imagesMentalhealthimage,
      date: "Wendesday, 14/5",
    ),
    UncomingEventsModel(
      text: "Nutration session",
      image: Assets.imagesNutration,
      date: "Thursday, 19/5",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 6,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: uncomingEventsModelList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 5),
              margin: EdgeInsets.symmetric(horizontal: 8),
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(uncomingEventsModelList[index].image),
                  fit: BoxFit.cover,
                ),
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Text(
                    uncomingEventsModelList[index].text,
                    maxLines: 2,
                    style: TextStyle(
                      color: MyColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
