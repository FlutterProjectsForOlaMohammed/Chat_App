import 'package:chatappfortest/Models/users_data.dart';
import 'package:chatappfortest/methods/create_new_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  CollectionReference addUser = FirebaseFirestore.instance.collection('Users');
  String? email;
  String? password;
  Future<void> registerMethod({
    required DataOfUser user,
  }) async {
    email = user.email;
    password = user.password;
    try {
      emit(RegisterLoading());
      await createNewUser(email: user.email, password: user.password);
      await _addUserToDataBase(user: user);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        emit(RegisterFailure(message: "Weak Password"));
      } else if (e.code == "email-already-in-use") {
        emit(RegisterFailure(message: "Email already in use"));
      }
    } catch (ex) {
      emit(RegisterFailure(message: "$ex"));
    }
  }

  Future<void> _addUserToDataBase({required DataOfUser user}) async {
    await addUser.add(
      {
        'First Name': user.firstName,
        'Last Name': user.lastName,
        'Email': email,
        'Password': password,
      },
    );
  }
}
