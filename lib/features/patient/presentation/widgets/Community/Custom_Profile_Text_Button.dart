import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';

class CustomProfileTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const CustomProfileTextButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    // استخدمنا InkWell عشان يدي تأثير الضغطة (Ripple Effect) الخفيف
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: MyColors.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}