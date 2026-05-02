import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Container_Medicine_Diet_Session_Lookout.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_All_Emojis.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_App_Bar.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Custom_Popular_Posts_Container.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Donate.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Row_Upcoming_See_All.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Home_Page/Uncoming_Events.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 25),
              CustomAllEmojis(),
              SizedBox(height: 25),
              CustomContainerMedicineDietSessionLookout(),
              SizedBox(height: 30),
              CustomRowUpcomingSeeAll(),
              SizedBox(height: 35),
              UncomingEvents(),
              SizedBox(height: 15),
              Divider(indent: 30, endIndent: 30, thickness: 0.5),
              SizedBox(height: 15),
              CustomPopularPostsContainer(),
              SizedBox(height: 25),
              Donate(),
              
            ],
          ),
        ),
      ),
    );
  }
}
