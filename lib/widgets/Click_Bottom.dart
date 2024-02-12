import 'package:flutter/material.dart';

class ClickBottom extends StatelessWidget {
  const ClickBottom({super.key, required this.text, required this.onTapped});
  final String text;
  final VoidCallback onTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff202d11),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              )),
          onPressed: onTapped,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
