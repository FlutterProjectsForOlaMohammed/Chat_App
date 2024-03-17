import 'dart:ui';
import 'package:chatappfortest/widgets/customized_text.dart';
import 'package:chatappfortest/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key, this.isLoading = false});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Container(
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
      ),
    );
  }
}
