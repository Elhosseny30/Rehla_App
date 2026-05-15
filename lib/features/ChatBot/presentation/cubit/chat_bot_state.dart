part of 'chat_bot_cubit.dart';

abstract class ChatBotState {}

class ChatBotInitial extends ChatBotState {}

class ChatBotLoading extends ChatBotState {}

class ChatBotSuccess extends ChatBotState {}

class ChatBotError extends ChatBotState {
  final String errorMessage;
  ChatBotError(this.errorMessage);
}
