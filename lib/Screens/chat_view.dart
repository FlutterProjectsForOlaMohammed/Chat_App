import 'package:chatappfortest/Constants.dart';
import 'package:chatappfortest/widgets/chat_view_loading.dart';
import 'package:chatappfortest/widgets/chat_view_messages.dart';
import 'package:chatappfortest/widgets/scholar_chat_logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Models/messages_data.dart';

CollectionReference userMessage =
    FirebaseFirestore.instance.collection('Messages');

class ChatPage extends StatefulWidget {
  static String id = 'ChatPage';

  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ScrollController forScorll = ScrollController();

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder(
      stream: userMessage.orderBy('Created At', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageData> reuturnedMessages = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            reuturnedMessages.add(MessageData.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              shadowColor: Colors.grey,
              elevation: 15,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        appPrimaryColor,
                        const Color.fromARGB(255, 96, 107, 83),
                        Colors.grey
                      ]),
                ),
              ),
              backgroundColor: appPrimaryColor,
              automaticallyImplyLeading: false,
              title: const ScholarChatLogo(
                title: "Chat",
              ),
              centerTitle: true,
            ),
            body: ChatViewMessages(
              forScorll: forScorll,
              data: reuturnedMessages,
              email: email,
              textController: textController,
            ),
          );
        } else {
          return const ChatViewLoading();
        }
      },
    );
  }
}
