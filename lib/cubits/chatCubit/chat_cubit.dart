import 'package:chatappfortest/Models/messages_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference userMessage =
      FirebaseFirestore.instance.collection('Messages');

  receiveMessages() async {
    List<MessageData> reuturnedMessages = [];
    try {
      userMessage
          .orderBy('Created At', descending: true)
          .snapshots()
          .listen((event) {
        reuturnedMessages = [];
        for (var doc in event.docs) {
          reuturnedMessages.add(MessageData.fromJson(doc));
        }
        emit(ChatReceivedMessages(messages: reuturnedMessages));
      });
    } on Exception catch (e) {
      emit(ChatNetworkFailure(errMessage: e.toString()));
    }
  }

  sendMessage({required String data, required String email}) async {
    try {
      await userMessage.add({
        'MessageBody': data,
        'Created At': DateTime.now(),
        'ID': email,
      });
    } on Exception catch (e) {
      emit(ChatNetworkFailure(errMessage: e.toString()));
    }
    receiveMessages();
  }
}
