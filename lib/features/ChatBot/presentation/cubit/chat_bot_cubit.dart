import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduationproject/core/utils/DioHelper.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/ChatBot/model/ChatBotModel.dart';
import 'package:graduationproject/features/ChatBot/model/Chat_Bot_Old_Model.dart';

part 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(ChatBotInitial());

  List<ChatBotModel> messages = [];

  List<ChatBotOldModel> chatHistory = [];
  String currentChatTitle = "New Chat";
  int? currentChatIndex;

  Future<void> sendMessageChatBot(
    String textMessage,
    String patinetId,
    String tokenPatient,
  ) async {
    if (textMessage.trim().isEmpty) return;

    messages.add(ChatBotModel(messages: textMessage, isUser: true));

    emit(ChatBotSuccess());

    emit(ChatBotLoading());

    try {
      final response = await DioHelper.postData(
        url: "api/Chatbot/ask",
        token: tokenPatient,
        data: {"question": textMessage, "patientId": patinetId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        String botReply = response.data['answer'];

        messages.add(ChatBotModel(messages: botReply, isUser: false));
        emit(ChatBotSuccess());
      }
    } on DioException catch (e) {
      String errorMessage = AuthAppFunctions().handleDioError(e);

      print("❌ Dio Error: ${e.response?.statusCode} - ${e.message}"); 
      print("❌ Data from server: ${e.response?.data}");
      emit(ChatBotError(errorMessage));
    } catch (e) {
      print("❌ Unexpected Error: ${e.toString()}");
      // 6. هندلة أي خطأ تاني برا الـ Dio (مثلاً مشكلة في تحويل الـ JSON أو كود ضرب)
      emit(ChatBotError("Unexcpected Error ${e.toString()}"));
    }
  }

  void saveCurrentChatToHistory() {
    if (messages.isNotEmpty) {
      String title = messages.first.messages;
      if (title.length > 25) {
        title = "${title.substring(0, 25)}....";
      }
      if (currentChatIndex != null) {
        chatHistory[currentChatIndex!] = ChatBotOldModel(
          title: title,
          oldChatMessages: List.from(messages),
        );
      } else {
        chatHistory.add(
          ChatBotOldModel(title: title, oldChatMessages: List.from(messages)),
        );
      }
    }

    messages.clear();
    currentChatTitle = "New Chat";
    emit(ChatBotInitial());
  }

  void loadChatFromHistory(ChatBotOldModel session) {
    messages = List.from(session.oldChatMessages);
    currentChatTitle = session.title;
    currentChatIndex = chatHistory.indexOf(session);
    emit(ChatBotSuccess());
  }

  void startNewChat() {
    saveCurrentChatToHistory();
    messages.clear();
    currentChatTitle = 'New Chat';
    currentChatIndex = null;
    emit(ChatBotInitial());
  }

  // void resetChat() {
  //   messages.clear();
  //   emit(ChatBotInitial());
  // }
}
