import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Activity_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Container_Activity_All_Notifications.dart';

class PatientCommunityActivityConversation extends StatelessWidget {
   PatientCommunityActivityConversation({super.key});
final List<ActivityModel> conversationList = [
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '1',
      actorName: "Support Team ",
      actionType: "CONVERSATION", 
      content: '"Your request has been processed successfully."',
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      actorAvatarUrl: null, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '2',
      actorName: "Dr. Ahmed Salem ",
      actionType: "CONVERSATION",
      content: '"Please remember to take your medication on time."',
      createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne, 
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '3',
      actorName: "Pharmacy Assistant ",
      actionType: "CONVERSATION",
      content: '"Your prescription is ready for pickup."',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '4',
      actorName: "Dr. Mona Ali ",
      actionType: "CONVERSATION",
      content: '"How are you feeling today after the new dosage?"',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '5',
      actorName: "Sara Ahmed ",
      actionType: "CONVERSATION",
      content: '"Hi! I saw your post in the support group."',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '6',
      actorName: "System Admin ",
      actionType: "CONVERSATION",
      content: '"Welcome to the Rehla community! Let us know if..."',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '7',
      actorName: "Dr. Khaled ",
      actionType: "CONVERSATION",
      content: '"Your recent test results look great, keep it up!"',
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '8',
      actorName: "Nutritionist Nada ",
      actionType: "CONVERSATION",
      content: '"Don\'t forget to drink plenty of water today."',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '9',
      actorName: "Rehab Coach ",
      actionType: "CONVERSATION",
      content: '"Are we still on for our session tomorrow?"',
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '10',
      actorName: "Omar Tarek ",
      actionType: "CONVERSATION",
      content: '"Thanks for the advice you shared yesterday!"',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      actorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '11',
      actorName: "Dr. Wael ",
      actionType: "CONVERSATION",
      content: '"Please book a follow-up appointment next week."',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '12',
      actorName: "Community Guidelines ",
      actionType: "CONVERSATION",
      content: '"We have updated our privacy policy. Please review it."',
      createdAt: DateTime.now().subtract(const Duration(days: 4)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '13',
      actorName: "Amira Adel ",
      actionType: "CONVERSATION",
      content: '"Can you send me the link to that article?"',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      actorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: false,
      id: '14',
      actorName: "Dr. Noha Saad ",
      actionType: "CONVERSATION",
      content: '"I\'ve sent the referral to the specialist as discussed."',
      createdAt: DateTime.now().subtract(const Duration(days: 6)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
    ActivityModel(
      referenceId: null,
      isRead: true,
      id: '15',
      actorName: "Customer Care ",
      actionType: "CONVERSATION",
      content: '"How would you rate your recent experience with the app?"',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
      actorAvatarUrl: null,
      targetImageUrl: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    
    // 2. حالة الـ Empty State (لو مفيش محادثات)
    if (conversationList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 64, color: Colors.grey.shade300), // أيقونة شات
            const SizedBox(height: 16),
            Text(
              "No new conversations yet",
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
            activity: conversationList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: conversationList.length,
      ),
    );
  }
}