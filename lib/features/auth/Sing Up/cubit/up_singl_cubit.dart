import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'up_singl_cubit.freezed.dart';
part 'up_singl_state.dart';

class UpSinglCubit extends Cubit<UpSinglState> {
  UpSinglCubit() : super(const UpSinglState.initial());

  singlup(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('user', true);
      prefs.setString('email', email);
      emit(const UpSinglState.success());
    } on FirebaseAuthException catch (e) {
      /// Адилет Байке могул жакты chat gbt кылды 👇////////////////
      if (e.code == 'weak-password') {
        emit(
            const UpSinglState.error('Предоставленный пароль слишком слабый.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const UpSinglState.error('Электронная почта уже используется.'));
      } else {
        emit(UpSinglState.error('Ошибка Firebase: ${e.message}'));
      }
      /////////////////
    }
  }
}
