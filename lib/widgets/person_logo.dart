import 'package:flutter/material.dart';

class PersonLogo extends StatelessWidget {
  const PersonLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 140,
      top: -45,
      child: CircleAvatar(
        backgroundColor: const Color(0xff202d11),
        radius: 42,
        child: Icon(
          Icons.person,
          size: 80,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
