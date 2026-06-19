import 'package:flutter/material.dart';

class CustomProfileIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CustomProfileIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.pinkAccent, size: 26),
      ),
    );
  }
}
