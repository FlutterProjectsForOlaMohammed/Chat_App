import 'package:chatappfortest/Constants.dart';
import 'package:flutter/material.dart';

class ChatViewLoading extends StatelessWidget {
  const ChatViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "wait , Loading All Messages ",
        style: TextStyle(
            color: appPrimaryColor,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 20),
      ),
    ));
  }
}
