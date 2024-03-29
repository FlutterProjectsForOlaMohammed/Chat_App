import 'package:chatappfortest/constants.dart';
import 'package:chatappfortest/cubits/chatCubit/chat_cubit.dart';
import 'package:chatappfortest/methods/build_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendMessageTextFormField extends StatefulWidget {
  const SendMessageTextFormField({
    super.key,
    required this.textController,
    required this.email,
    required this.forScorll,
  });

  final TextEditingController textController;
  final String? email;
  final ScrollController forScorll;

  @override
  State<SendMessageTextFormField> createState() =>
      _SendMessageTextFormFieldState();
}

class _SendMessageTextFormFieldState extends State<SendMessageTextFormField> {
  String? data;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: TextFormField(
        controller: widget.textController,
        onSaved: (value) {
          data = value;
        },
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is Required";
          }
          return null;
        },
        decoration: InputDecoration(
            focusedBorder: buildBorder(),
            enabledBorder: buildBorder(),
            border: buildBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.send,
                color: appPrimaryColor,
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  await BlocProvider.of<ChatCubit>(context)
                      .sendMessage(data: data!, email: widget.email!);
                  widget.textController.clear();
                  widget.forScorll.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                }
              },
            ),
            hintText: 'Send Message',
            hintStyle: TextStyle(
                fontSize: 18,
                color: appPrimaryColor,
                fontStyle: FontStyle.italic),
            contentPadding: const EdgeInsets.all(16)),
      ),
    );
  }
}
