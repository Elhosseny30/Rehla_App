import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Cunstom_Container_Daily_Care_Completion.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Custom_Container_App_Bar_Medical_Summary.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Custom_Medical_Summary_container.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Custom_Row_Medication_Nutiration_Daily_Chaeck.dart';

class PatientMedicalSummary extends StatelessWidget {
  const PatientMedicalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    print("Medical");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                CustomContainerAppBarMedicalSummary(),
                SizedBox(height: 15),
                CustomMedicalSummaryContainer(),
                SizedBox(height: 10),
                CunstomContainerDailyCareCompletion(),
                CustomRowMedicationNutirationDailyChaeck(),
                
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
