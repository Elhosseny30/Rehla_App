import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const CustomToggleButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFF48A4) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.pink.shade300,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}