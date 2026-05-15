import 'package:flutter/material.dart';

class AnimatedBubble extends StatefulWidget {
  final Widget child;
  final int delayInMillis; // وقت التأخير عشان يظهروا ورا بعض

  const AnimatedBubble({
    super.key, 
    required this.child, 
    required this.delayInMillis,
  });

  @override
  State<AnimatedBubble> createState() => _AnimatedBubbleState();
}

class _AnimatedBubbleState extends State<AnimatedBubble> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 500), // سرعة الحركة نفسها
    );

    // حركة الانزلاق من تحت لفوق
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    
    // حركة الشفافية (من مخفي لظاهر)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // تشغيل الأنيميشن بعد التأخير المطلوب
    Future.delayed(Duration(milliseconds: widget.delayInMillis), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}