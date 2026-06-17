import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Group_Posts.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Photo_Name_What_mind.dart';

class PatientCommunityGroupsPage extends StatelessWidget {
  const PatientCommunityGroupsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomPhotoNameWhatMind(),
          CustomGroupPosts(),
         
        ],
      ),
    );
  }
}
