import 'package:flutter/material.dart';

class PrefixIcon extends StatelessWidget {
  const PrefixIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 58,
        width: 50,
        color: Colors.white.withOpacity(0.5),
        child: Icon(
          icon,
          size: 26,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}
