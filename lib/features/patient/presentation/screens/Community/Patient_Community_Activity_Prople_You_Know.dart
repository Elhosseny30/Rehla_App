import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Activity_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Container_Activity_All_Notifications.dart';

class PatientCommunityActivityPeopleYouKnow extends StatelessWidget {
   PatientCommunityActivityPeopleYouKnow({super.key});
final List<ActivityModel> peopleList = [
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '1',
      actorName: "Salma Youssef ",
      actionType: "SUGGEST_PERSON", 
      content: null,
      createdAt: DateTime.now(), 
      actorAvatarUrl: null, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '2',
      actorName: "Dr. Khaled ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '3',
      actorName: "Omar Tarek ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '4',
      actorName: "Dr. Ahmed Salem ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '5',
      actorName: "Nourhan Hassan ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '6',
      actorName: "Hala Mahmoud ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '7',
      actorName: "Dr. Mona Ali ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 10)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '8',
      actorName: "Khaled Youssef ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '9',
      actorName: "Sara Ahmed ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '10',
      actorName: "Dr. Mostafa ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '11',
      actorName: "Youssef Hassan ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '12',
      actorName: "Salma Ali ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '13',
      actorName: "Dr. Noha Saad ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '14',
      actorName: "Amira Adel ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '15',
      actorName: "Tarek Fathy ",
      actionType: "SUGGEST_PERSON",
      content: null,
      createdAt: DateTime.now().subtract(const Duration(days: 6)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
if (peopleList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey.shade300), // أيقونة أشخاص
            const SizedBox(height: 16),
            Text(
              "No suggestions at the moment",
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
            activity: peopleList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: peopleList.length,
      ),
    );
    }
}