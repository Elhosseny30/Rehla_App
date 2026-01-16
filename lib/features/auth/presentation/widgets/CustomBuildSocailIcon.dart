import 'package:flutter/material.dart';

class CustomBuildSocialIcon extends StatelessWidget {
  const CustomBuildSocialIcon({
    super.key,
    required this.icon,
    required VoidCallback this.onTap,
  });
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12), 
        decoration: BoxDecoration(
          shape: BoxShape.circle, 
          border: Border.all(
            color: Colors.grey.shade300, 
            width: 1,
          ),
          color: Colors.white, 
        ),
        child: icon, 
      ),
    );
  }
}
