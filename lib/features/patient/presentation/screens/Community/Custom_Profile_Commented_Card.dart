import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/ProfileCommentModel.dart';

class CustomProfileCommentCard extends StatelessWidget {
  final ProfileCommentModel comment;

  const CustomProfileCommentCard({
    super.key,
    required this.comment,
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
          // الجزء العلوي: أيقونة + سياق الكومنت
          Row(
            children: [
              Icon(Icons.chat_bubble_outline, size: 18, color: Colors.grey.shade500),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                    children: [
                      const TextSpan(text: 'You commented on '),
                      TextSpan(
                        text: "${comment.postAuthorName}'s post",
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // نص الكومنت جوه فقاعة (Bubble) رمادي فاتح عشان يبان إنه "كومنت"
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Text(
              comment.commentContent,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // الوقت بتاع الكومنت
          Text(
            comment.timeAgo,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}