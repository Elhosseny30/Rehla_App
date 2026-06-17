import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Post_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Post_Card.dart';

class CustomHomePosts extends StatelessWidget {
   CustomHomePosts({super.key});
final List<PostModel> posts = [
    PostModel(
      time : "10 minutes ago",
      groupName: null,
      groupImageUrl: null,
      id: 1,
      content:
          "Good nutrition is half the cure 🌿🍅. Adding natural colors to your daily meals gives your body the vitamins it needs to stay strong and restore energy during and after treatments. Make a fresh salad a daily habit on your table! ✨",
      postType: "Story",
      imageUrl: [
        Assets.imagesSaladFirstPost, // صورة تجريبية
      ],
      authorId: "12345",
      authorName: "Basma Ahmed",
      reactionsCount: 120,
      commentsCount: 45,
      authorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      isLikedByCurrentUser: true, // عشان نجرب شكل القلب الأحمر
      postVisibility: "Public",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
      isEdited: false,
      reactionCounts: {},
    ),
    PostModel(
      time : "22 minutes ago",
      groupName: null,
      groupImageUrl: null,
      id: 2,
      content:
          "Sometimes, the most powerful healing comes from simply knowing someone is there to hold your hand. 🫂 Support groups remind us that our fears are shared and our victories are celebrated together. Tag someone who has been your rock during your journey! ✨",
      postType: "Story",
      authorAvatarUrl: Assets.imagesSecondPostAmiraIslam,
      imageUrl: [Assets.imagesHandSecondPost], // لستة صور فاضية
      authorId: "67890",
      authorName: "Amira Islam",
      reactionsCount: 12,
      commentsCount: 3,
      isLikedByCurrentUser: false, // القلب هنا هيبقى رمادي
      postVisibility: "Public",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isEdited: false,
      reactionCounts: {},
    ),
    PostModel(
      time : "32 minutes ago",
      groupName: null,
      groupImageUrl: null,
      id: 2,
      content: "A quick reminder to all the brave women here: listening to your body is just as important as your treatment plan. If you are feeling unusually fatigued, please allow yourself to rest. Don't hesitate to communicate any new symptoms with your medical team. We are here for you! 🩺💙",
      postType: "Story",
      authorAvatarUrl: Assets.imagesThirdPostDrAtefBasem,
      imageUrl: [], // لستة صور فاضية
      authorId: "67890",
      authorName: "Amira Islam",
      reactionsCount: 12,
      commentsCount: 3,
      isLikedByCurrentUser: false, // القلب هنا هيبقى رمادي
      postVisibility: "Public",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isEdited: false,
      reactionCounts: {},
    ),

    PostModel(
      time : "40 minutes ago",
      groupName: null,
      groupImageUrl: null,
      id: 2,
      content: "Today was a bit of a heavy day, honestly. Sometimes the anxiety creeps in, but reading everyone's posts here on Rehla reminds me that I'm part of an incredible sisterhood. Just a reminder to anyone struggling today: be gentle with yourself. We are taking this one day at a time. 🌸💪",
      postType: "Story",
      authorAvatarUrl: Assets.imagesFourthPostNadaAhmed,
      imageUrl: [], // لستة صور فاضية
      authorId: "67890",
      authorName: "Amira Islam",
      reactionsCount: 12,
      commentsCount: 3,
      isLikedByCurrentUser: false, // القلب هنا هيبقى رمادي
      postVisibility: "Public",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isEdited: false,
      reactionCounts: {},
    ),

    PostModel(
      time : "45 minutes ago",
      groupName: null,
      groupImageUrl: null,
      id: 2,
      content: "Gentle movements can make a huge difference in our recovery. 🧘‍♀️ Stretching helps relieve the physical tension from treatments and brings a moment of peace to a busy mind. Remember to listen to your body and go at your own pace today. ✨",
      postType: "Story",
      authorAvatarUrl: Assets.imagesFifithPostZeinabMostafa,
      imageUrl: [Assets.imagesFifthPost], // لستة صور فاضية
      authorId: "67890",
      authorName: "Amira Islam",
      reactionsCount: 12,
      commentsCount: 3,
      isLikedByCurrentUser: false, // القلب هنا هيبقى رمادي
      postVisibility: "Public",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isEdited: false,
      reactionCounts: {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                // بنبعت كل بوست للويدجت بتاعة الـ PostCard عشان تترسم
                return PostCard(post: posts[index]);
              },
              childCount: posts.length, // عدد البوستات اللي هترجع من الـ API
            ),
          );
  }
}