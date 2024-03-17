part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatSendMessage extends ChatState {}

final class ChatNetworkFailure extends ChatState {
  final String errMessage;

  ChatNetworkFailure({required this.errMessage});
}

class ChatReceivedMessages extends ChatState {
  final List<MessageData> messages;

  ChatReceivedMessages({required this.messages});
}
