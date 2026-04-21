import 'package:flutter/material.dart';

class PatientMedicalSummary extends StatelessWidget {
  PatientMedicalSummary({super.key});
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child:Text("Medical")),
        ],
      ),
    );
  }
}
