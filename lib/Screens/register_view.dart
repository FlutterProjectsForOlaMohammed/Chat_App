import 'package:chatappfortest/Screens/chat_view.dart';
import 'package:chatappfortest/cubits/registerCubit/register_cubit.dart';
import 'package:chatappfortest/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushNamed(context, ChatPage.id,
                  arguments: BlocProvider.of<RegisterCubit>(context).email);
            } else if (state is RegisterFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            return RegisterViewBody(
              isLoading: (state is RegisterLoading) ? true : false,
            );
          },
        ),
      ),
    );
  }
}
