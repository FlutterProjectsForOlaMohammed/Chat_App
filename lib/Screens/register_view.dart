import 'package:chatappfortest/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: const RegisterViewBody(),
    );
  }
}
