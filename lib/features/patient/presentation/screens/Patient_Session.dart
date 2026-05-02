import 'package:flutter/material.dart';

class PatientSession extends StatelessWidget {
  const PatientSession({super.key});

  @override
  Widget build(BuildContext context) {
    print("Session");
    return Scaffold(
      body: Column(children: [Center(child: Text("Session"))]),
    );
  }
}
