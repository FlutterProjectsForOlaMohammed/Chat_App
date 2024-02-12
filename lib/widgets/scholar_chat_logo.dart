import 'package:flutter/material.dart';

class ScholarChatLogo extends StatelessWidget {
  const ScholarChatLogo({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/scholar.png",
          height: 50,
          width: 50,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico'),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
