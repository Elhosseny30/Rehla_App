import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Activity_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Container_Activity_All_Notifications.dart';

class PatientCommunityActivityFollowsPage extends StatelessWidget {
   PatientCommunityActivityFollowsPage({super.key});
 final List<ActivityModel> followsList = [
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '1',
      actorName: "Sara Ahmed ",
      actionType: "FOLLOW", 
      content: null,
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      actorAvatarUrl: null, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '2',
      actorName: "Dr. Mona Ali ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '3',
      actorName: "Khaled Youssef ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '4',
      actorName: "Dr. Ahmed Salem ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '5',
      actorName: "Nourhan Hassan ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '6',
      actorName: "Omar Tarek ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '7',
      actorName: "Hala Mahmoud ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '8',
      actorName: "Dr. Mostafa ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '9',
      actorName: "Youssef Hassan ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '10',
      actorName: "Salma Ali ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 4)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '11',
      actorName: "Dr. Noha Saad ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '12',
      actorName: "Tarek Fathy ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '13',
      actorName: "Amira Adel ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '14',
      actorName: "Kareem Elhosseny ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '15',
      actorName: "Dr. Wael ",
      actionType: "FOLLOW",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 6)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {



    if (followsList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add_disabled, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              "No new follows yet",
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

    // 3. لو في داتا، هنرسم اللستة باستخدام نفس الويدجت اللي عملناها في شاشة All
    return Scaffold(
      backgroundColor: Colors.white, // عشان تضمن إن الخلفية بيضاء
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return CustomContainerActivityAllNotifications(
            activity: followsList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: followsList.length,
      ),
    );
  }
}