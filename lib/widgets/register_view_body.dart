import 'dart:ui';
import 'package:chatappfortest/widgets/customized_text.dart';
import 'package:chatappfortest/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/Blurredimage.jpg",
              ),
              fit: BoxFit.cover)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: const Column(
          children: [
            SizedBox(
              height: 70,
            ),
            CustomizedText(
              text: "REGISTER",
            ),
            Divider(
              endIndent: 30,
              indent: 30,
            ),
            SizedBox(
              height: 25,
            ),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
