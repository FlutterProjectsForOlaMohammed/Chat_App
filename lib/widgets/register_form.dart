import 'package:chatappfortest/Models/users_data.dart';
import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/Screens/login_view.dart';
import 'package:chatappfortest/cubits/registerCubit/register_cubit.dart';
import 'package:chatappfortest/widgets/Click_Bottom.dart';
import 'package:chatappfortest/widgets/text_form_field.dart';
import 'package:chatappfortest/widgets/login_or_register_customized_row.dart';
import 'package:chatappfortest/widgets/person_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, firstName, lastName, confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Expanded(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        prefixIcon: Icons.person_add_alt_1_sharp,
                        text: "First Name",
                        onSaved: (data) {
                          firstName = data;
                        },
                      ),
                      CustomTextFormField(
                        prefixIcon: Icons.person_add_alt_1_sharp,
                        text: "Last Name",
                        onSaved: (data) {
                          lastName = data;
                        },
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
                      CustomTextFormField(
                        prefixIcon: Icons.confirmation_number_sharp,
                        text: "Confirm Password",
                        obcureText: true,
                        onSaved: (data) {
                          confirmPassword = data;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      LoginOrRegisterCustomizedRow(
                        leftText: "I already Have an Account .. ",
                        rightText: " Login",
                        onTap: () {
                          Navigator.pushNamed(context, LoginPage.id);
                        },
                      ),
                      ClickBottom(
                        text: "REGISTER",
                        onTapped: () async {
                          if (formKey.currentState!.validate() &&
                              password == confirmPassword) {
                            formKey.currentState!.save();
                            DataOfUser user = DataOfUser(
                                firstName: firstName!,
                                lastName: lastName!,
                                email: email!,
                                password: password!);
                            await BlocProvider.of<RegisterCubit>(context)
                                .registerMethod(user: user);
                          } else {
                            showSnackBar(context,
                                "Please Confirm Password in right way ");
                          }
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
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}
