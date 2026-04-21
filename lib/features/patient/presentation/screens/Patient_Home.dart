import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Container_Medicine_Diet_Session_Lookout.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Custom_All_Emojis.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Custom_App_Bar.dart';

class PatientHomePage extends StatelessWidget {
  PatientHomePage({super.key});
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 25),
          CustomAllEmojis(),
          SizedBox(height: 25),
          CustomContainerMedicineDietSessionLookout(),
        ],
      ),
    );
  }
}
