import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: const LoginViewBody(),
    );
  }
}
