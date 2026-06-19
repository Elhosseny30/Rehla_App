import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/ProfileCommentModel.dart';
import 'package:graduationproject/features/patient/presentation/screens/Community/Custom_Profile_Commented_Card.dart';

class PatientCommunityProfileComments extends StatelessWidget {
   PatientCommunityProfileComments({super.key});
final List<ProfileCommentModel> commentsList = [
    ProfileCommentModel(
      id: '1',
      postAuthorName: 'Dr. Ahmed Salem',
      commentContent: 'Thank you for this valuable information! I will definitely try to add more greens to my diet.',
      timeAgo: '2 hours ago',
    ),
    ProfileCommentModel(
      id: '2',
      postAuthorName: 'Sara Youssef',
      commentContent: 'Stay strong, Sara! We are all here supporting you in your journey. 💙',
      timeAgo: '1 day ago',
    ),
    ProfileCommentModel(
      id: '3',
      postAuthorName: 'Cancer Support Group',
      commentContent: 'Is the group meeting still scheduled for tomorrow at 5 PM?',
      timeAgo: '3 days ago',
    ),
    ProfileCommentModel(
      id: '4',
      postAuthorName: 'Nutrition Hub',
      commentContent: 'Can I replace spinach with kale in this recipe?',
      timeAgo: '1 week ago',
    ),
    ProfileCommentModel(
      id: '5',
      postAuthorName: 'Dr. Mona Ali',
      commentContent: 'This article was exactly what I needed to read today. Thanks!',
      timeAgo: '2 weeks ago',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    if (commentsList.isEmpty) {
      return const Center(
        child: Text(
          "No comments yet",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // استخدمنا CustomScrollView عشان تشتغل بامتياز مع الـ NestedScrollView اللي برا
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CustomProfileCommentCard(comment: commentsList[index]);
              },
              childCount: commentsList.length,
            ),
          ),
        ),
      ],
    );
  }
  }



