import 'package:chatappfortest/methods/build_border.dart';
import 'package:chatappfortest/widgets/prefix_icon.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.obcureText,
    required this.onSaved,
    required this.prefixIcon,
  });

  final String text;
  final bool? obcureText;
  final void Function(String?) onSaved;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white.withOpacity(0.4),
        ),
        child: TextFormField(
          cursorColor: Colors.black.withOpacity(0.4),
          validator: (data) {
            if (data?.isEmpty ?? true) {
              return "Required";
            }
            return null;
          },
          onSaved: onSaved,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 18,
              fontWeight: FontWeight.bold),
          obscureText: (obcureText == null) ? false : obcureText!,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            hintText: text,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
            prefixIcon: PrefixIcon(icon: prefixIcon),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            border: buildBorder(),
          ),
        ),
      ),
    );
  }
}
