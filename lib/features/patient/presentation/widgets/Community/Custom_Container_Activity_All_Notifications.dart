import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Activity_Model.dart';

class CustomContainerActivityAllNotifications extends StatelessWidget {
  final ActivityModel activity;
  const CustomContainerActivityAllNotifications({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    final actionText = AuthAppFunctions().getActionTextActivityCommunity(
      activity.actionType,
    );
    final timeString = AuthAppFunctions().getTimeAgoActivityModel(
      activity.createdAt,
    );

    final isGroup = activity.actionType == 'SUGGEST_GROUP';
    final isPersonSuggestion = activity.actionType == 'SUGGEST_PERSON'; // شيكنا على النوع هنا

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // خلينا الزرار يبقى متسنتر مع الصورة
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: activity.actorAvatarUrl != null
                ? Colors.transparent
                : (isGroup ? Colors.pink.shade50 : Colors.grey.shade200),
            backgroundImage: activity.actorAvatarUrl != null
                ? AssetImage(activity.actorAvatarUrl!)
                : null,
            child: activity.actorAvatarUrl != null
                ? null
                : Icon(
                    isGroup ? Icons.group : Icons.person,
                    color: isGroup ? Colors.pinkAccent : Colors.grey,
                  ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                    children: [
                      TextSpan(
                        text: activity.actorName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: actionText,
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      if (activity.content != null) ...[
                        TextSpan(
                          text: activity.content,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timeString,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
      
          // هنا التعديل الجديد: لو ده اقتراح شخص، هنحط زرار فولو
          if (isPersonSuggestion) ...[
            const SizedBox(width: 8),
            SizedBox(
              height: 32, // ارتفاع الزرار عشان يبقى شكله مناسب
              child: ElevatedButton(
                onPressed: () {
                  // TODO: ضيف اللوجيك بتاع الـ Follow هنا
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: MyColors.mainColor, // ممكن تغيره للون الـ Primary بتاع التطبيق
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // بيخلي الزرار بحواف دائرية ناعمة
                  ),
                ),
                child: const Text(
                  'Follow',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ] 
          // لو مش اقتراح شخص، شوف لو فيه صورة تارجت وحطها زي ما كانت
          else if (activity.targetImageUrl != null) ...[
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                activity.targetImageUrl!,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ]
        ],
      ),
    );
  }
}