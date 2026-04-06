import 'package:flutter/material.dart';

class OrContinueWithWidget extends StatelessWidget {
  const OrContinueWithWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 60,
            thickness: 1,
            color: const Color.fromARGB(87, 135, 132, 132),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            text,
            style: TextStyle(
              //fontFamily: fontsApp.mainFont,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            endIndent: 60,
            thickness: 1,
            color: const Color.fromARGB(87, 135, 132, 132),
          ),
        ),
      ],
    );
  }
}
