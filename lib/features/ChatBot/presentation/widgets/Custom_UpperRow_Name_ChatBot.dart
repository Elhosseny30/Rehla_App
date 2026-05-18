import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';
import 'package:graduationproject/features/ChatBot/presentation/widgets/Custom_Container_Sheet_Bottom.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomUpperrowNameChatbot extends StatelessWidget {
  const CustomUpperrowNameChatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<ChatBotCubit, ChatBotState>(
          builder: (context, state) {
            return CustomWelcomeTextWidget(
              text: context.read<ChatBotCubit>().currentChatTitle,
              size: 24,
              fontWeight: FontWeight.w500,
              color: MyColors.mainColor,
            );
          },
        ),
        IconButton(
          onPressed: () {
            // هنا بنستدعي الـ Modal Bottom Sheet
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              builder: (BuildContext context) {
                return BlocBuilder<ChatBotCubit, ChatBotState>(
                  builder: (context, state) {
                    return Container(
                      height:
                          MediaQuery.of(context).size.height *
                          .75, // ارتفاع مبدئي للتجربة
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),

                          // ده كود الـ Drag Handle (البتاعة الرصاصي)
                          Container(
                            width:
                                MediaQuery.of(context).size.width *
                                0.20, // عرض المقبض
                            height: 5, // سمك المقبض
                            decoration: BoxDecoration(
                              color: Colors.grey[300], // اللون الرصاصي
                              borderRadius: BorderRadius.circular(
                                10,
                              ), // الحواف الدائرية بتاعتها
                            ),
                          ),
                          SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              context.read<ChatBotCubit>().startNewChat();
                              context.pop();
                            },
                            child: Container(
                              margin: EdgeInsets.all(18),
                              padding: EdgeInsets.only(
                                left: 16,
                                top: 12,
                                bottom: 12,
                                right: 12,
                              ),
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
                                text: "New Chat",
                                size: 18,
                                fontWeight: FontWeight.w400,
                                color: MyColors.blackColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: context
                                  .read<ChatBotCubit>()
                                  .chatHistory
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomContainerBottomSheet(
                                  session: context
                                      .read<ChatBotCubit>()
                                      .chatHistory.reversed.toList()[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 35,
            fontWeight: FontWeight.w200,
            color: MyColors.mainColor,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            context.read<ChatBotCubit>().saveCurrentChatToHistory();
            (context).pop();
          },
          icon: Icon(Icons.remove, size: 35, color: MyColors.mainColor),
        ),
      ],
    );
  }
}
