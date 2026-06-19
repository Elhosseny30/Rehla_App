import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Profile_Saved_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Profile_Saved_Card.dart';

class PatientCommunityProfileSaved extends StatelessWidget {
   PatientCommunityProfileSaved({super.key});
final List<ProfileSavedModel> savedList = [
    ProfileSavedModel(
      id: '1',
      authorName: 'Dr. Ahmed Salem',
      content: 'Here is a quick guide on how to manage fatigue during chemotherapy. 1. Stay hydrated. 2. Take short naps...',
      timeAgo: '2 days ago',
      likes: 124,
      comments: 32,
    ),
    ProfileSavedModel(
      id: '2',
      authorName: 'Nutrition Hub',
      content: 'Top 5 antioxidant-rich foods you should include in your daily meals: Berries, Spinach, Dark Chocolate, Pecans, and Artichokes. 🥦🍓',
      timeAgo: '1 week ago',
      likes: 89,
      comments: 14,
    ),
    ProfileSavedModel(
      id: '3',
      authorName: 'Cancer Support Group',
      content: 'Reminder: Our weekly meditation session is tomorrow. Mental health is just as important as physical health! 🧘‍♀️✨',
      timeAgo: '3 weeks ago',
      likes: 56,
      comments: 5,
    ),
  ];
  @override
  Widget build(BuildContext context) {
   if (savedList.isEmpty) {
      return const Center(
        child: Text(
          "No saved posts yet",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // نفس استخدام الـ CustomScrollView عشان ندمجها صح مع الـ NestedScrollView
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CustomProfileSavedCard(savedItem: savedList[index]);
              },
              childCount: savedList.length,
            ),
          ),
        ),
      ],
    );
  
  }
}