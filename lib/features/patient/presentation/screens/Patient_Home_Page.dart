import 'package:flutter/material.dart';

import 'package:graduationproject/features/patient/presentation/widgets/Custom_All_Emojis.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Custom_App_Bar.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 25),
          CustomAllEmojis(),
          SizedBox(height: 25,),

          
        ],
      ),
    );
  }
}
