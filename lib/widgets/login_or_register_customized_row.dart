import 'package:chatappfortest/constants.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterCustomizedRow extends StatelessWidget {
  const LoginOrRegisterCustomizedRow({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onTap,
  });

  final String leftText, rightText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          leftText,
          style: TextStyle(
            color: appPrimaryColor,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            rightText,
            style: TextStyle(
                color: appPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
