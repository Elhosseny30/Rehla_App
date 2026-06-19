import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Activity_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Container_Activity_All_Notifications.dart';

class PatientCommunityActivityAllPage extends StatelessWidget {
  PatientCommunityActivityAllPage({super.key});

 final List<ActivityModel> activityAllList = [
    // 1. لايك على كومنت
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '1',
      actorName: "Basma Basm ",
      actionType: "LIKED_COMMENT",
      content: '"This A Valuable Opinion"',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    // 2. لايك على بوست
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '2',
      actorName: "Amira Ahmed ",
      actionType: "LIKE_POST",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: Assets.imagesActivityallgroupgirls,
    ),
    // 3. اقتراح جروب
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '3',
      actorName: "Cancer Support Group ",
      actionType: "SUGGEST_GROUP",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      actorAvatarUrl: null, 
      targetImageUrl: null,
    ),
    // 4. فولو
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '4',
      actorName: "Sara Ahmed ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne, 
      targetImageUrl: null,
    ),
    // 5. رسالة / محادثة
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '5',
      actorName: "Support Team ",
      actionType: "CONVERSATION",
      content: '"Your request has been processed successfully."',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    // 6. منشن
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '6',
      actorName: "Nourhan ",
      actionType: "MENTION",
      content: '"Check out this article about recovery!"',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    // 7. اقتراح شخص
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '7',
      actorName: "Salma Youssef ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    // 8. لايك على بوست تاني
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '8',
      actorName: "Dr. Khaled ",
      actionType: "LIKE_POST",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: Assets.imagesActivityallgroupgirls,
    ),
    // 9. اقتراح جروب تاني
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '9',
      actorName: "Nutrition Group ",
      content: null,
      actionType: "SUGGEST_GROUP",
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    // 10. لايك كومنت
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '10',
      actorName: "Omar Tarek ",
      actionType: "LIKED_COMMENT",
      content: '"Exactly what I was looking for!"',
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    // 11. فولو
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '11',
      actorName: "Dr. Mona Ali ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    // 12. رسالة
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '12',
      actorName: "Dr. Ahmed Salem ",
      actionType: "CONVERSATION",
      content: '"Please remember to take your medication on time."',
      createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 5)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    // 13. منشن
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '13',
      actorName: "Hala Mahmoud ",
      actionType: "MENTION",
      content: '"Do you agree with this opinion?"',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    // 14. اقتراح جروب
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '14',
      actorName: "Mental Health Support ",
      actionType: "SUGGEST_GROUP",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    // 15. لايك بوست
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '15',
      actorName: "Youssef Hassan ",
      actionType: "LIKE_POST",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      actorAvatarUrl: null,
      targetImageUrl: Assets.imagesActivityallgroupgirls,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return CustomContainerActivityAllNotifications(
            activity: activityAllList[index],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: activityAllList.length,
      ),
    );
  }
}

