import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Custom_Sesson_Item_Model.dart';
// import 'session_item_model.dart'; // مسار الموديل

class SessionItemCard extends StatelessWidget {
  final SessionItemModel item;

  const SessionItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bool isDoctor = item.type == SessionItemType.doctor;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 85,
              height: 85,
              color: Colors.grey.shade100, // لون خلفية مؤقت
              child: item.imageUrl.isNotEmpty
                  ? (item.imageUrl.startsWith('http') // 🌟 بنسأل هنا: هل ده لينك؟
                      ? Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.person, color: Colors.grey.shade400, size: 40),
                        )
                      : Image.asset( // 🌟 لو مش لينك، يبقى صورة Local من الـ Assets
                          item.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.person, color: Colors.grey.shade400, size: 40),
                        ))
                  : Icon(Icons.image, color: Colors.grey.shade400, size: 40),
            ),
          ),
          const SizedBox(width: 16),
          
          // 2. التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                
                // 3. الجزء المتغير (النجوم للدكتور، الـ Host للإيفنت)
                if (isDoctor)
                  Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFFFF48A4), size: 16),
                      const SizedBox(width: 4),
                      Text('${item.rating ?? 0.0}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(width: 4),
                      Text('(${item.reviewsCount ?? 0} reviews)', style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
                    ],
                  )
                else if (item.hostName != null)
                  Text(
                    item.hostName!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700, fontWeight: FontWeight.w500),
                  ),

                const SizedBox(height: 16),
                
                // 4. الزراير المتغيرة
                Row(
                  children: [
                    _buildPrimaryButton(title: isDoctor ? 'Contact' : 'Join'),
                    const SizedBox(width: 8),
                    _buildSecondaryButton(title: isDoctor ? 'View profile' : 'Learn more'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(color: const Color(0xFFFF48A4), borderRadius: BorderRadius.circular(20)),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildSecondaryButton({required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFFF48A4)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(title, style: const TextStyle(color: Color(0xFFFF48A4), fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }
}