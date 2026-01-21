import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/fonts.dart';

class CustomWelcomeTextWidget extends StatelessWidget {
  const CustomWelcomeTextWidget({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
 
  });
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Center(
        child: Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text,
          style: TextStyle(
            fontFamily: fontsApp.mainFont,
            fontWeight: fontWeight,
            fontSize: size,
            color: color,
          ),
        ),
      ),
    );
  }
}
