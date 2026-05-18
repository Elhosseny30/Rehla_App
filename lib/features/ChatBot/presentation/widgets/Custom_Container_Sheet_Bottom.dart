import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/ChatBot/model/Chat_Bot_Old_Model.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomContainerBottomSheet extends StatelessWidget {
  const CustomContainerBottomSheet({super.key, required this.session});
  final ChatBotOldModel session;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ChatBotCubit>().loadChatFromHistory(session);
        context.pop();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18,vertical: 12),
        padding: EdgeInsets.only(left: 16, top: 12, bottom: 12, right: 12),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.greyRegisterColorContainer,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(18),
          color: MyColors.whiteColor,
        ),
        child: CustomWelcomeTextWidget(
          text: session.title,
          size: 18,
          fontWeight: FontWeight.w400,
          color: MyColors.blackColor,
        ),
      ),
    );
  }
}
