import 'package:chatappfortest/methods/user_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  String? email;
  String? password;
  Future<void> loginMethod({
    required String email,
    required String password,
  }) async {
    this.email = email;
    this.password = password;
    emit(LoginLoading());
    try {
      await userSignIn(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(message: "User Not Found"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(message: "Wrong Password"));
      }
    } catch (ex) {
      emit(LoginFailure(message: "$ex"));
    }
  }
}
