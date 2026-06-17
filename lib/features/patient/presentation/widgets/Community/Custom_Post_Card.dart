import 'package:flutter/material.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_Post_Model.dart';
import 'package:flutter/cupertino.dart';
// متنساش تعمل import للموديل بتاعك هنا
// import '.../Custom_Post_Model.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({Key? key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.groupName != null) ...[
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: post.groupImageUrl != null
                        ? Image.asset(
                            post.groupImageUrl!,
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 24,
                            height: 24,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.group,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(width: 8),
                  // اسم الجروب
                  Text(
                    post.groupName!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              Divider(height: 20, color: Colors.grey.shade200, thickness: 1),
            ],
            // 1. الجزء اللي فوق (صورة اليوزر واسمه)
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: post.authorAvatarUrl != null
                      ? AssetImage(post.authorAvatarUrl!)
                      : null,
                  backgroundColor: Colors.grey.shade200,
                  child: post.authorAvatarUrl == null
                      ? const Icon(Icons.person, color: Colors.grey)
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.authorName ?? "User",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // الوقت (يفضل تستخدم حزمة timeago عشان تعرضها زي التصميم)
                      Text(
                        post.time!, // قيمة مؤقتة لحد ما نظبط الـ Format
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz, color: Colors.grey),
                  onPressed: () {
                    // أكشن مسح البوست أو الخيارات
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 2. محتوى البوست (النص)
            Text(post.content, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),

            // 3. صورة البوست (لو موجودة)
            if (post.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  post.imageUrl.first,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            if (post.imageUrl.isNotEmpty) const SizedBox(height: 12),

            // 4. زراير التفاعل (اللايك والكومنت والشير)
            Row(
              children: [
                Icon(
                  post.isLikedByCurrentUser
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: post.isLikedByCurrentUser ? Colors.pink : Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  post.reactionsCount.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 16),
                const Icon(
                  CupertinoIcons.chat_bubble,
                  color: Colors.grey,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  post.commentsCount.toString(),
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 16),
                const Icon(
                  CupertinoIcons.reply,
                  color: Colors.grey,
                  size: 20,
                ), // أيقونة الشير
                const SizedBox(width: 4),
                const Text('1', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
