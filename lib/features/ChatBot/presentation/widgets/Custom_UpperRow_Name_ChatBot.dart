import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';
import 'package:graduationproject/features/auth/presentation/widgets/WelcomeTextWidget.dart';

class CustomUpperrowNameChatbot extends StatelessWidget {
  const CustomUpperrowNameChatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomWelcomeTextWidget(
          text: "Need help",
          size: 24,
          fontWeight: FontWeight.w500,
          color: MyColors.mainColor,
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
                return Container(
                  height:
                      MediaQuery.of(context).size.height *
                      0.75, // ارتفاع مبدئي للتجربة
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
                      const Center(
                        child: Text(
                          "هنا هنبني قائمة المحادثات بعدين",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
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
            (context).pop();
            context.read<ChatBotCubit>().resetChat();
          },
          icon: Icon(Icons.remove, size: 35, color: MyColors.mainColor),
        ),
      ],
    );
  }
}
