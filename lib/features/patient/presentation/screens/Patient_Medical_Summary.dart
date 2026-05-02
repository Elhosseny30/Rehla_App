import 'package:flutter/material.dart';

class PatientMedicalSummary extends StatelessWidget {
  const PatientMedicalSummary({super.key});
  
  @override
  Widget build(BuildContext context) {
    print("Medical");
    return Scaffold(
      body: Column(
        children: [
          Center(child:Text("Medical")),
        ],
      ),
    );
  }
}
