import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Activity_Page.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Groups_Page.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Home_Page.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Patient_Community_Profile_Page.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Container_Community_App_Bar.dart';

class PatientCommunity extends StatelessWidget {
  const PatientCommunity({super.key});

  @override
  Widget build(BuildContext context) {
   
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Scaffold(
          backgroundColor: MyColors.whiteColor,
          body: Column(
            children: [
              CustomContainerCommunityAppBar(),
              SizedBox(height: 5),
              Divider(color: MyColors.greyRegisterColorContainer, thickness: 2),

              TabBar(
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
                  Tab(text: "Home"),
                  Tab(text: "Groups"),
          
                  Tab(text: "Activity"),
                  Tab(text: "Profile"),
                ],
              ),

              SizedBox(height: 0),
              Divider(color: MyColors.greyRegisterColorContainer, thickness: 2),
              Expanded(
                child: TabBarView(
                  children: [
                    
                    PatientCommunityHomePage(),
                    PatientCommunityGroupsPage(),
             
                    PatientCommunityActivityPage(),
                    PatientCommunityProfilePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
