import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Profile_Mention_Model.dart';

class CustomProfileMentionCard extends StatelessWidget {
  final ProfileMentionModel mention;

  const CustomProfileMentionCard({
    super.key,
    required this.mention,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // لو المنشن جديد، هندي الكارت خلفية بينك فاتحة جداً، لو قديم هيبقى أبيض
        color: mention.isNew ? Colors.pink.shade50.withOpacity(0.4) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: mention.isNew ? Colors.pink.shade100 : Colors.grey.shade200, 
          width: 1.5
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الجزء العلوي: صورة اليوزر + سياق المنشن
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: mention.authorAvatarUrl != null
                    ? AssetImage(mention.authorAvatarUrl!) // أو NetworkImage لو من الباك إند
                    : null,
                child: mention.authorAvatarUrl == null
                    ? Icon(Icons.person, size: 18, color: Colors.grey.shade500)
                    : null,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                    children: [
                      TextSpan(
                        text: mention.authorName,
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const TextSpan(text: ' mentioned you'),
                    ],
                  ),
                ),
              ),
              // علامة @ صغيرة عشان تبين إن ده منشن
              Icon(Icons.alternate_email, size: 16, color: Colors.pink.shade300),
            ],
          ),
          
          const SizedBox(height: 12),
          
          // نص الكومنت/البوست اللي فيه المنشن
          Text(
            mention.content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // الوقت بتاع المنشن
          Text(
            mention.timeAgo,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}