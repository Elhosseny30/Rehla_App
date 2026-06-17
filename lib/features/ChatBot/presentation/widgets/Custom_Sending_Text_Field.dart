import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/utils/colors.dart';
import 'package:graduationproject/features/ChatBot/presentation/cubit/chat_bot_cubit.dart';

class CustomSendingTextField extends StatefulWidget {
  const CustomSendingTextField({super.key});

  @override
  State<CustomSendingTextField> createState() => _CustomSendingTextFieldState();
}

class _CustomSendingTextFieldState extends State<CustomSendingTextField> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 32.0,
        top: 8.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        decoration: BoxDecoration(
          //color: Colors.white,
          borderRadius: BorderRadius.circular(30.0), // شكل الكبسولة
          border: Border.all(
            color: MyColors.mainColor, // لون الإطار الخارجي
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            // زر الإضافة الدائري
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.mainColor, width: 1.0),
              ),
              child: InkWell(
                onTap: () {},
                child: Icon(Icons.add, size: 20, color: MyColors.mainColor),
              ),
            ),

            const SizedBox(width: 8),

            // حقل النصببببب
            Expanded(
              child: TextField(
                controller: textController,
                style: const TextStyle(fontSize: 16.0, color: Colors.black87),
                decoration: InputDecoration(
                  hintText: "Ask anything",
                  hintStyle: TextStyle(
                    color: MyColors.greyRegisterColorContainer,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),

            // زر الإرسال الدائري
            Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: MyColors.mainColor, width: 1.0),
              ),
              child: InkWell(
                onTap: () {
                  String textMessage = textController.text;
                  String patientId = "cf6aec4e-3db4-4b1c-b006-08391dd60812";
                  /**DOMEEEMEMEMEME */
                  String token = "Assets.token";
                  if (textMessage.isNotEmpty) {
                    context.read<ChatBotCubit>().sendMessageChatBot(
                      textMessage,
                      patientId,
                      token,
                    );
                    textController.clear();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                  ), // تظبيط مكان أيقونة السهم في النص
                  child: Icon(
                    Icons.send_outlined,
                    size: 18,
                    color: MyColors.mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
