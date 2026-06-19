import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_User_Profile.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Profile_Comments.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Profile_Mentions.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Profile_Posts.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Profile_Saved.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/CustomContainer_Header_Profile_User.dart';

class PatientCommunityProfilePage extends StatelessWidget {
  PatientCommunityProfilePage({super.key});

  final UserProfileModel userProfileList = UserProfileModel(
    id: '1',
    username: '@Nor_Basm21',
    fullName: 'Nor Basm',
    profileImageUrl: null,
    followersCount: 289,
    followingCount: 318,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 4),

                      CustomcontainerHeaderProfileUser(
                        userProfile: userProfileList,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),

                SliverAppBar(
                  pinned: true, //
                  floating: true,
                  backgroundColor: MyColors.whiteColor,
                  elevation: 0,
                  toolbarHeight: 0, // بنشيل مساحة الـ AppBar الافتراضي
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(
                      50,
                    ), // ارتفاع الـ TabBar
                    child: Container(
                      color: MyColors
                          .whiteColor, // عشان الخلفية تفضل بيضا وهو بيلزق
                      child: TabBar(
                        //padding: EdgeInsets.only(left: 8),
                        isScrollable: false,
                        labelPadding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: const Color(0xFFFFE1EE),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        labelColor: const Color(0xFFFF48A4),
                        unselectedLabelColor: Colors.grey.shade400,
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        tabs: const [
                          Tab(text: "Posts"),
                          Tab(text: "Comments"),
                          Tab(text: "Mentions"),
                          Tab(text: "Saved"),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },

            // 3. محتوى التابات بيتحط في الـ body
            body: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ), // الـ SizedBox اللي كان تحت الـ TabBar
              child: TabBarView(
                children: [
                  PatientCommunityProfilePosts(), // الـ CustomScrollView بتاعك هيشتغل هنا زي الفل
                  PatientCommunityProfileComments(),
                  PatientCommunityProfileMentions(),
                  PatientCommunityProfileSaved(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
