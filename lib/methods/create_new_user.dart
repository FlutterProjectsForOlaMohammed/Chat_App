import 'package:firebase_auth/firebase_auth.dart';

Future<void> createNewUser({
  required String email,
  required String password,
}) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}
