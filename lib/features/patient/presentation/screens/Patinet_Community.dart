import 'package:flutter/material.dart';

class PatientCommunity extends StatelessWidget {
  const PatientCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    print("Community");
    return Scaffold(
      body: Column(
        children: [
          Center(child:Text("Community")),
        ],
      ),
    );
  }
}