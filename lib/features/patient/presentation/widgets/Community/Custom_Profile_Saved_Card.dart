import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Profile_Saved_Model.dart';

class CustomProfileSavedCard extends StatelessWidget {
  final ProfileSavedModel savedItem;

  const CustomProfileSavedCard({
    super.key,
    required this.savedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الهيدر: صورة افتراضية + اسم صاحب البوست + أيقونة الحفظ (Bookmark)
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey.shade100,
                child: Icon(Icons.person, color: Colors.grey.shade400),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      savedItem.authorName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                    ),
                    Text(
                      savedItem.timeAgo,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ),
              // علامة الـ Bookmark مميزة عشان تعرفه إن ده محفوظ
              Icon(Icons.bookmark, color: const Color(0xFFFF48A4), size: 24),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // محتوى البوست نفسه
          Text(
            savedItem.content,
            maxLines: 4, // ممكن نخليه يقطع الكلام لو طويل أوي عشان ده Preview
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          
          const SizedBox(height: 16),
          
          // الفوتر: أرقام التفاعل (لايكات وكومنتات)
          Row(
            children: [
              Icon(Icons.favorite_border, size: 18, color: Colors.grey.shade500),
              const SizedBox(width: 4),
              Text(
                savedItem.likes.toString(),
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              const SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey.shade500),
              const SizedBox(width: 4),
              Text(
                savedItem.comments.toString(),
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}