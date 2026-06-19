import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomPhotoNameWhatMind extends StatelessWidget {
  const CustomPhotoNameWhatMind({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: InkWell(
          onTap: () {
            // هنا تفتح شاشة الـ Create Post أو الـ BottomSheet
          },
          child: Row(
            children: [
              // صورة اليوزر (تقدر تجيبها من الـ Cache أو بيانات اليوزر المسجلة)
               CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.person, size: 40, color: Colors.grey),
              ),
              const SizedBox(width: 12),
              // عمود فيه الاسم وتحته الجملة
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomWelcomeTextWidget(
                    text: "Nor_Basm21",
                    size: 18,
                    fontWeight: FontWeight.w400,
                    color: MyColors.blackColor,
                  ),
                  const SizedBox(height: 2),
                  CustomWelcomeTextWidget(
                    text: "What's on your mind?",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
