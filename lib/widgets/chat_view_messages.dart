import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/cubits/chatCubit/chat_cubit.dart';
import 'package:chatappfortest/widgets/chat_bubble_for_friend.dart';
import 'package:chatappfortest/widgets/chat_bubble_for_me.dart';
import 'package:chatappfortest/widgets/send_message_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatViewMessages extends StatelessWidget {
  const ChatViewMessages({
    super.key,
    required this.forScorll,
    required this.email,
    required this.textController,
  });

  final ScrollController forScorll;

  final String? email;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is ChatReceivedMessages) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      controller: forScorll,
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        return state.messages[index].id == email
                            ? ChatBubbleForMe(
                                text: state.messages[index].messageBody,
                              )
                            : ChatBubbleForFriend(
                                text: state.messages[index].messageBody,
                              );
                      });
                } else if (state is ChatNetworkFailure) {
                  return Center(
                    child: Text(
                      "Check Internet Connection ",
                      style: TextStyle(
                          color: appPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20),
                    ),
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: appPrimaryColor,
                  ));
                }
              },
            ),
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
