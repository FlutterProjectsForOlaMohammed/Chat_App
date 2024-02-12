import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSignIn({
  required String email,
  required String password,
}) async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}
