import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/cubits/loginCubit/login_cubit.dart';
import 'package:chatappfortest/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginViewBody(),
      ),
    );
  }
}
// loading --> click on 
// success --> chat view 
// failure --> showsnackbar
// initila --> login view body 