import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Activity_ALL_Page.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Activity_Conversation.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Activity_Follows_Page.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Activity_Mentions.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Activity_Prople_You_Know.dart';

class PatientCommunityActivityPage extends StatelessWidget {
  //final ActivityModel? activityModel;
  const PatientCommunityActivityPage({super.key /* this.activityModel*/});

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: MyColors.whiteColor,
      body: DefaultTabController(
        length: 5,
        child: Column(
          
          children: [
            SizedBox(height: 16,),
            TabBar(
              isScrollable: true,
              padding: EdgeInsets.zero,
              //labelPadding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 4),

              // المسافة بين كل كبسولة والتانية
              //padding: EdgeInsets.only(right:8 ),
              tabAlignment: TabAlignment.start,
              // 🌟 مهم: بيخلي الـ indicator على قد حجم الـ Container بالظبط مش التاب كلها
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent, // بيخفي الخط الرمادي اللي تحت
              // شكل الكبسولة وهي متحددة (خلفية بينك)
              indicator: BoxDecoration(
                color: MyColors.mainColor,
                borderRadius: BorderRadius.circular(30),
              ),
              labelColor: MyColors.whiteColor,

              unselectedLabelColor: MyColors.mainColor,
              tabs: const [
                CustomTabBarActivity(text: "All"),
                CustomTabBarActivity(text: "Follows"),
                CustomTabBarActivity(text: "Conversation"),
                CustomTabBarActivity(text: "Mentions"),
                CustomTabBarActivity(text: "People you know"),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  PatientCommunityActivityAllPage(),
                  PatientCommunityActivityFollowsPage(),
                  PatientCommunityActivityConversation(),
                  PatientCommunityActivityMentions(),
                  PatientCommunityActivityPeopleYouKnow()
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTabBarActivity extends StatelessWidget {
  final String text;
  const CustomTabBarActivity({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: MyColors.mainColor),
        ),

        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14, // صغرنا الخط سنة عشان يناسب المسافات الجديدة
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
