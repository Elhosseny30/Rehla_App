import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';
import 'package:graduationproject/features/ChatBot/presentation/widgets/Custom_Scrol_chat_Bot.dart';
import 'package:graduationproject/features/ChatBot/presentation/widgets/Custom_Sending_Text_Field.dart';
import 'package:graduationproject/features/ChatBot/presentation/widgets/Custom_UpperRow_Name_ChatBot.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) return;

        context.read<ChatBotCubit>().saveCurrentChatToHistory();
        context.pop();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomUpperrowNameChatbot(),
                CustomScrolChatBot(),
                CustomSendingTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
