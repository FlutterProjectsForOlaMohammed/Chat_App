import 'package:chatappfortest/Screens/chat_view.dart';
import 'package:chatappfortest/Screens/login_view.dart';
import 'package:chatappfortest/Screens/register_view.dart';
import 'package:chatappfortest/cubits/chatCubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => const LoginPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
