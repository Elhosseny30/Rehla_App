import 'package:flutter/material.dart';

class hekko extends StatelessWidget {
  const hekko({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(name,style: TextStyle(
        fontSize: 40,
      ),)),
    );
  }
}
