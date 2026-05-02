import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/model/popular_Posts.dart';

class CustomEachPopularPostContainer extends StatelessWidget {
  CustomEachPopularPostContainer({super.key});
  final List<PopularPostsModel> popularPostsModelList = [
    PopularPostsModel(
      text: "Week 3 chemo, here's what helped me....",
      numberOfLoves: 400,
      numberOfCommnets: 48,
      uploadedByDoctor: false,
    ),
    
    PopularPostsModel(
      text: "Some advices to help you nutritation an......",
      numberOfLoves: 350,
      numberOfCommnets: 30,
      uploadedByDoctor: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: popularPostsModelList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomWelcomeTextWidget(
                text: popularPostsModelList[index].text,
                size: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.blackColor,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.heart, color: Colors.grey, size: 14),
                  SizedBox(width: 5),
                  CustomWelcomeTextWidget(
                    text: popularPostsModelList[index].numberOfLoves.toString(),
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: MyColors.blackColor,
                  ),
                  SizedBox(width: 25),
                  FaIcon(
                    FontAwesomeIcons.comment,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(width: 5),
                  CustomWelcomeTextWidget(
                    text: popularPostsModelList[index].numberOfCommnets
                        .toString(),
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: MyColors.blackColor,
                  ),
                  SizedBox(width: 25),
                  TextButton(
                    onPressed: () {},
                    child: CustomWelcomeTextWidget(
                      text: "View full post",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 25),
                  if (popularPostsModelList[index].uploadedByDoctor) ...{
                    CustomWelcomeTextWidget(
                      text: "uploaded by \na doctor",
                      size: 14,
                      fontWeight: FontWeight.w400,
                      color: MyColors.mainColor,
                    ),
                  },
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
