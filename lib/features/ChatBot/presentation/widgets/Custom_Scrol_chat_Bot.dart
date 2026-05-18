import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduationproject/core/constants/imagesAssets.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';
import 'package:graduationproject/features/ChatBot/presentation/widgets/Custom_Chat_Bot_Fast_Message.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';
import 'package:graduationproject/features/patient/presentation/widgets/Medical_Summary/Animation_Bubble.dart';

class CustomScrolChatBot extends StatelessWidget {
  CustomScrolChatBot({super.key});
  final List<Widget> chatMessages = [
    AnimatedBubble(
      delayInMillis: 1000,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        width: 100, // الحجم الكلي شامل الـ Halo الخارجي
        height: 100,
        padding: const EdgeInsets.all(25), // المسافة اللي بتحدد عرض الـ Halo
        decoration: const BoxDecoration(
          color: MyColors.blurPink, // لون الـ Halo الخارجي (الوردي الفاتح جداً)
          shape: BoxShape.circle,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(
              0xFFFF48A4,
            ), // لون الـ Container الأساسي (الوردي الغامق)
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(Assets.imagesChatbotLogo),
        ),
      ),
    ),
    AnimatedBubble(
      delayInMillis: 1500,
      child: const CustomChatBotFastMessage(
        messege: "Want any help?",
        patientId: "cf6aec4e-3db4-4b1c-b006-08391dd60812",
        token: Assets.token,
      ),
    ),

    AnimatedBubble(
      delayInMillis: 2000,
      child: const CustomChatBotFastMessage(
        messege: "set a reminder for meds or an appointment",
        patientId: "cf6aec4e-3db4-4b1c-b006-08391dd60812",
        token: Assets.token,
      ),
    ),
    AnimatedBubble(
      delayInMillis: 2500,
      child: const CustomChatBotFastMessage(
        messege: "Create you nutrition plan",
        patientId: "cf6aec4e-3db4-4b1c-b006-08391dd60812",
        token: Assets.token,
      ),
    ),
    AnimatedBubble(
      delayInMillis: 3000,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: CustomWelcomeTextWidget(
          text: "Anything you need,\nRafek is here",
          size: 24,
          fontWeight: FontWeight.w500,
          color: MyColors.blackColor,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ChatBotCubit, ChatBotState>(
        builder: (context, state) {
          var stateCubit = context.read<ChatBotCubit>();
          if (stateCubit.messages.isEmpty) {
            return ListView.builder(
              // عوضنا عن SizedBox(height: 300) و SizedBox(height: 75) بالـ padding ده
              padding: const EdgeInsets.only(top: 375, bottom: 75),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return Padding(
                  // عوضنا عن SizedBox(height: 15) اللي كان بين العناصر
                  // بنحط مسافة 15 تحت كل رسالة، ما عدا آخر رسالة مش بنحط تحتها مسافة
                  padding: EdgeInsets.only(
                    bottom: index == chatMessages.length - 1 ? 0 : 15.0,
                  ),
                  child: Align(
                    alignment: Alignment
                        .centerLeft, // عشان يحافظ على نفس محاذاة CrossAxisAlignment.start
                    child: chatMessages[index],
                  ),
                );
              },
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemCount: stateCubit.messages.length,
                  itemBuilder: (context, index) {
                    final message = stateCubit.messages[index];

                    // هنا بنعرض الرسالة الحقيقية
                    return RealChatBubble(
                      text: message.messages,
                      isUser: message.isUser,
                    );
                  },
                ),
              ),

              // عرض "Rafek is typing..." لو الحالة Loading
              if (state is ChatBotLoading)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Rafek is typing...",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class RealChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;

  const RealChatBubble({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.grey[200] : MyColors.blurPink,
          borderRadius: BorderRadius.circular(16).copyWith(
            bottomRight: isUser
                ? const Radius.circular(0)
                : const Radius.circular(16),
            bottomLeft: !isUser
                ? const Radius.circular(0)
                : const Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isUser ? Colors.black87 : MyColors.blackColor,
          ),
        ),
      ),
    );
  }
}
