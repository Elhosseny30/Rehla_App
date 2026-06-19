import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Activity_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Container_Activity_All_Notifications.dart';

class PatientCommunityActivityMentions extends StatelessWidget {
  final List<ActivityModel> mentionList = [
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '1',
      actorName: "Nourhan ",
      actionType: "MENTION", 
      content: '"Check out this article about recovery!"',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      actorAvatarUrl: null, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '2',
      actorName: "Hala Mahmoud ",
      actionType: "MENTION",
      content: '"Do you agree with this opinion?"',
      createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '3',
      actorName: "Dr. Khaled ",
      actionType: "MENTION",
      content: '"I mentioned you in the weekly health discussion."',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '4',
      actorName: "Basma Basm ",
      actionType: "MENTION",
      content: '"This reminds me of what we discussed yesterday."',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: Assets.imagesActivityallgroupgirls, // حطينا صورة بوست هنا عشان نستت الـ UI
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '5',
      actorName: "Omar Tarek ",
      actionType: "MENTION",
      content: '"Can you help with this question?"',
      createdAt: DateTime.now().subtract(const Duration(hours: 4)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '6',
      actorName: "Salma Youssef ",
      actionType: "MENTION",
      content: '"Great point here, I think you should see this."',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '7',
      actorName: "Amira Adel ",
      actionType: "MENTION",
      content: '"Take a look at this new diet plan."',
      createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      actorAvatarUrl: null,
      targetImageUrl: Assets.imagesActivityallgroupgirls,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '8',
      actorName: "Dr. Ahmed Salem ",
      actionType: "MENTION",
      content: '"Please check the updated community guidelines."',
      createdAt: DateTime.now().subtract(const Duration(hours: 14)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '9',
      actorName: "Youssef Hassan ",
      actionType: "MENTION",
      content: '"Is this the correct way to do the exercise?"',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '10',
      actorName: "Ali Farouk ",
      actionType: "MENTION",
      content: '"We were just talking about this topic!"',
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 5)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '11',
      actorName: "Sara Ahmed ",
      actionType: "MENTION",
      content: '"I found the answer to your question here."',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      actorAvatarUrl: null,
      targetImageUrl: Assets.imagesActivityallgroupgirls,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '12',
      actorName: "Dr. Mona Ali ",
      actionType: "MENTION",
      content: '"Good progress, check out these tips as well."',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '13',
      actorName: "Khaled Youssef ",
      actionType: "MENTION",
      content: '"This article is exactly what you need right now."',
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '14',
      actorName: "Mental Health Support ",
      actionType: "MENTION",
      content: '"Don\'t forget our group session tomorrow."',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '15',
      actorName: "Tarek Fathy ",
      actionType: "MENTION",
      content: '"We missed your input in the group chat!"',
      createdAt: DateTime.now().subtract(const Duration(days: 6)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    
    // 2. حالة الـ Empty State (لو مفيش منشن)
    if (mentionList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.alternate_email, size: 64, color: Colors.grey.shade300), // أيقونة @
            const SizedBox(height: 16),
            Text(
              "No new mentions yet",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    // 3. رسم اللستة
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return CustomContainerActivityAllNotifications(
            activity: mentionList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: mentionList.length,
      ),
    );
  }
}
