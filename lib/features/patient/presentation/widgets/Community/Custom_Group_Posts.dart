import 'package:flutter/material.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Post_Model.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Post_Card.dart';

class CustomGroupPosts extends StatelessWidget {
  CustomGroupPosts({super.key});
  final List<PostModel> groupPosts = [
    // 1. بوست لمريضة بتحتفل بآخر جلسة (فيه صورة للبوست، ومفيش صورة للجروب)
    PostModel(
      time: "10 minutes ago",
      id: 1,
      groupName: "Support Warriors",
      groupImageUrl: Assets
          .imagesGroupPhotoFirstPost, // عشان نجرب أيقونة الجروب الافتراضية
      content:
          "Today marks my last chemotherapy session! I couldn't have done it without the support of everyone in this group. Thank you for holding my hand through the toughest days. 💖💪",
      postType: "Story",
      imageUrl: [Assets.imagesFirstPostGroupOne],
      authorId: "67890",
      authorName: "Basma Basm",
      authorAvatarUrl: Assets.imagesFirstPersonGroupOne,
      reactionsCount: 340,
      commentsCount: 85,
      isLikedByCurrentUser: true,
      postVisibility: "Group",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      isEdited: false,
      reactionCounts: {},
    ),

    // 2. بوست لمشاركة وصفة أكل (مفيش صورة للبوست، وفيه صورة للجروب)
    PostModel(
      time: "22 minutes ago",
      id: 2,
      groupName: "Nutrition & Wellness",
      groupImageUrl: Assets
          .imagesSeondpostgroupphoto, // استخدمنا أي صورة عندك كصورة للجروب
      content:
          "I tried a new green smoothie recipe today that really helped with the nausea. Let me know if anyone wants the ingredients! 🌿🍏",
      postType: "Story",
      imageUrl: [Assets.imagesSecondpostgroupphoto], // بوست نصي فقط
      authorId: "12345",
      authorName: "Basma Ahmed",
      authorAvatarUrl: Assets.imagesFirstPostBasmaAhmed,
      reactionsCount: 150,
      commentsCount: 22,
      isLikedByCurrentUser: false,
      postVisibility: "Group",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      isEdited: false,
      reactionCounts: {},
    ),

    // 3. بوست لدكتور بيدي نصيحة (نصي فقط)
    PostModel(
      time: "30 minutes ago",
      id: 3,
      groupName: "Medical Q&A",
      groupImageUrl: Assets.imagesThirdpostgroupohoto,
      content:
          "A quick reminder to our warriors: staying hydrated is crucial during your radiation therapy. Aim for at least 8 glasses of water a day. Feel free to drop any questions below. 💧🩺",
      postType: "Story",
      imageUrl: [],
      authorId: "99999",
      authorName: "Dr. Akram Ahmed",
      authorAvatarUrl: Assets.imagesDrAkramAhmed,
      reactionsCount: 89,
      commentsCount: 14,
      isLikedByCurrentUser: false,
      postVisibility: "Group",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      isEdited: false,
      reactionCounts: {},
    ),

    PostModel(
      time: "40 minute ago",
      id: 4,
      groupName: "Hope & Regrowth",
      groupImageUrl: Assets.imagesFourthpostgropohoto,
      content:
          "Look what I noticed today! A tiny bit of fuzzy hair is finally growing back after months of finishing chemotherapy. 🌟 It feels like a beautiful new beginning. Sending so much love and hope to everyone still in the middle of their fight right now!",
      postType: "Story",
      imageUrl: [], // بوست نصي للتنويع
      authorId: "11223",
      authorName: "Sarah Mansour",
      authorAvatarUrl: Assets
          .imagesAvaterfourthgroupphoto, // عشان تختبر الأيقونة الافتراضية لليوزر كمان
      reactionsCount: 520,
      commentsCount: 112,
      isLikedByCurrentUser: false,
      postVisibility: "Group",
      mediaUrls: [],
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
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
          return PostCard(post: groupPosts[index]);
        },
        childCount: groupPosts.length, // عدد البوستات اللي هترجع من الـ API
      ),
    );
  }
}
