import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:graduationproject/core/utils/DioHelper.dart';
import 'package:graduationproject/core/utils/functions.dart';
import 'package:graduationproject/features/ChatBot/model/ChatBotModel.dart';

part 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(ChatBotInitial());

  List<ChatBotModel> messages = [];

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
      emit(ChatBotError(errorMessage));
    } catch (e) {
      // 6. هندلة أي خطأ تاني برا الـ Dio (مثلاً مشكلة في تحويل الـ JSON أو كود ضرب)
      emit(ChatBotError("Unexcpected Error ${e.toString()}"));
    }
  }

  void resetChat() {
    messages.clear();
    emit(ChatBotInitial());
  }
}
