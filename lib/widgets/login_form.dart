import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/Screens/chat_view.dart';
import 'package:chatappfortest/Screens/register_view.dart';
import 'package:chatappfortest/methods/user_sign_in.dart';
import 'package:chatappfortest/widgets/Click_Bottom.dart';
import 'package:chatappfortest/widgets/text_form_field.dart';
import 'package:chatappfortest/widgets/customized_text.dart';
import 'package:chatappfortest/widgets/login_or_register_customized_row.dart';
import 'package:chatappfortest/widgets/person_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? email, password;

  bool isLoading = false;

  FirebaseAuth usersignIn = FirebaseAuth.instance;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(
        color: appPrimaryColor,
      ),
      child: ListView(children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              const CustomizedText(
                text: "LOGIN",
              ),
              const Divider(
                endIndent: 30,
                indent: 30,
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Stack(clipBehavior: Clip.none, children: [
                  const PersonLogo(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextFormField(
                          prefixIcon: Icons.email,
                          text: "Email",
                          onSaved: (data) {
                            email = data;
                          },
                        ),
                        CustomTextFormField(
                          prefixIcon: Icons.lock,
                          text: "Password",
                          obcureText: true,
                          onSaved: (data) {
                            password = data;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginOrRegisterCustomizedRow(
                          leftText: "I Don't Have an Account ?  ",
                          rightText: " Register",
                          onTap: () {
                            Navigator.pushNamed(context, RegisterPage.id);
                          },
                        ),
                        ClickBottom(
                          text: "LOGIN",
                          onTapped: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              try {
                                await userSignIn(
                                  email: email!,
                                  password: password!,
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamed(context, ChatPage.id,
                                    arguments: email);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  // ignore: use_build_context_synchronously
                                  showSnackBar(
                                      context, 'No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  // ignore: use_build_context_synchronously
                                  showSnackBar(context,
                                      'Wrong password provided for that user.');
                                }
                              } catch (ex) {
                                // ignore: use_build_context_synchronously
                                showSnackBar(context, ex.toString());
                              }
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).viewInsets.bottom,
        )
      ]),
    );
  }
}
