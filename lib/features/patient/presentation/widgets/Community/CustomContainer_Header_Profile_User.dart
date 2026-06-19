import 'package:flutter/material.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/patient/model/Community/Custom_User_Profile.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Profile_Icon_Button.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Community/Custom_Profile_Text_Button.dart';

class CustomcontainerHeaderProfileUser extends StatelessWidget {
  final UserProfileModel userProfile;
  const CustomcontainerHeaderProfileUser({
    super.key,
    required this.userProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.5, 
            color: Colors.grey.shade200, 
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: userProfile.profileImageUrl != null
                  ? NetworkImage(
                      userProfile.profileImageUrl!,
                    )
                  : null,
              child: userProfile.profileImageUrl == null
                  ? const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey,
                    )      
                  : null,
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userProfile.username, 
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    userProfile.fullName, //     
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 8),

                  // عدد المتابعين
                  Row(
                    children: [
                      Text(
                        "${userProfile.followersCount} followers",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          "•",
                          style: const TextStyle(
                            color: MyColors.blackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "${userProfile.followingCount} following",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        CustomProfileTextButton(
                          text: "Edit profile",
                          onTap: () {
                            // TODO: افتح شاشة تعديل البروفايل
                          },
                        ),
                        const SizedBox(width: 8),
                        CustomProfileTextButton(
                          text: "Share profile",
                          onTap: () {
                            // TODO: نفذ كود الشير
                          },
                        ),
                        const SizedBox(width: 8),
                        CustomProfileIconButton(
                          icon: Icons.more_horiz,
                          onTap: () {
                            // TODO: افتح الـ Bottom Sheet أو المنيو
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



