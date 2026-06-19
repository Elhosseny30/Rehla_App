import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  final String label;

  const CustomFilterChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1.5,
          color: Colors.pink.shade200),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.pink.shade300,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}