import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Profile_Mention_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Profile_Mentioned_Card.dart';

class PatientCommunityProfileMentions extends StatelessWidget {
   PatientCommunityProfileMentions({super.key});
final List<ProfileMentionModel> mentionsList = [
    ProfileMentionModel(
      id: '1',
      authorName: 'Nourhan',
      content: 'Check out this article about recovery, @Nor_Basm21! I think you will find it very helpful.',
      timeAgo: '5 hours ago',
      isNew: true, // منشن جديد
    ),
    ProfileMentionModel(
      id: '2',
      authorName: 'Dr. Khaled',
      content: '@Nor_Basm21 mentioned you in the weekly health discussion regarding the new diet plans.',
      timeAgo: '1 day ago',
    ),
    ProfileMentionModel(
      id: '3',
      authorName: 'Hala Mahmoud',
      content: 'Do you agree with this opinion, @Nor_Basm21?',
      timeAgo: '2 days ago',
    ),
    ProfileMentionModel(
      id: '4',
      authorName: 'Mental Health Support',
      content: 'Don\'t forget our group session tomorrow at 6 PM, @Nor_Basm21 and @Sara_Ahmed.',
      timeAgo: '4 days ago',
    ),
    ProfileMentionModel(
      id: '5',
      authorName: 'Youssef Hassan',
      content: '@Nor_Basm21 Is this the correct way to do the stretching exercise you mentioned yesterday?',
      timeAgo: '1 week ago',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    if (mentionsList.isEmpty) {
      return const Center(
        child: Text(
          "No mentions yet",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // CustomScrollView عشان الـ NestedScrollView اللي في الشاشة الرئيسية يشتغل صح
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CustomProfileMentionCard(mention: mentionsList[index]);
              },
              childCount: mentionsList.length,
            ),
          ),
        ),
      ],
    );
  
  }
}


