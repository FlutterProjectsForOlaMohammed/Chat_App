import 'dart:ui';
import 'package:chatappfortest/Screens/chat_view.dart';
import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/cubits/chatCubit/chat_cubit.dart';
import 'package:chatappfortest/cubits/loginCubit/login_cubit.dart';
import 'package:chatappfortest/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "assets/images/Blurredimage.jpg",
            ),
            fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              BlocProvider.of<ChatCubit>(context).receiveMessages();
              Navigator.pushNamed(context, ChatPage.id,
                  arguments: BlocProvider.of<LoginCubit>(context).email);
            } else if (state is LoginFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const LoginForm(
                isLoading: true,
              );
            } else {
              return const LoginForm(
                isLoading: false,
              );
            }
          },
        ),
      ),
    );
  }
}
