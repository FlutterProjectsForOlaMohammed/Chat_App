import 'package:chatappfortest/Constants.dart';
import 'package:chatappfortest/widgets/chat_view_messages.dart';
import 'package:chatappfortest/widgets/scholar_chat_logo.dart';
import 'package:flutter/material.dart';

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
    String email = ModalRoute.of(context)!.settings.arguments as String;
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
          email: email,
          textController: textController,
        ));
  }
}
