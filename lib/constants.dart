import 'package:flutter/material.dart';

Color appPrimaryColor = const Color(0xff202d11);
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
