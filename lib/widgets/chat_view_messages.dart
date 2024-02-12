import 'package:chatappfortest/Models/messages_data.dart';
import 'package:chatappfortest/widgets/chat_bubble_for_friend.dart';
import 'package:chatappfortest/widgets/chat_bubble_for_me.dart';
import 'package:chatappfortest/widgets/send_message_text_form_field.dart';
import 'package:flutter/material.dart';

class ChatViewMessages extends StatelessWidget {
  const ChatViewMessages({
    super.key,
    required this.forScorll,
    required this.data,
    required this.email,
    required this.textController,
  });

  final ScrollController forScorll;
  final List<MessageData> data;
  final Object? email;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
                reverse: true,
                controller: forScorll,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return data[index].id == email
                      ? ChatBubbleForMe(
                          text: data[index].messageBody,
                        )
                      : ChatBubbleForFriend(
                          text: data[index].messageBody,
                        );
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: SendMessageTextFormField(
              textController: textController,
              email: email,
              forScorll: forScorll),
        )
      ],
    );
  }
}
