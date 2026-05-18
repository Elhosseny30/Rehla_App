import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomChatBotFastMessage extends StatelessWidget {
  const CustomChatBotFastMessage({super.key, required this.messege,required this.patientId,required this.token});
  final String messege;
  final String patientId;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.blurPink,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {
          context.read<ChatBotCubit>().sendMessageChatBot(
            messege,
            patientId,
            token,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          // الـ padding الداخلي اللي كان في الـ Container
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: CustomWelcomeTextWidget(
            text: messege,
            size: 16,
            fontWeight: FontWeight.w400,
            color: MyColors.blackColor,
          ),
        ),
      ),
    );
  }
}
