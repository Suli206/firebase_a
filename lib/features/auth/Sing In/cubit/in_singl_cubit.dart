import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'in_singl_cubit.freezed.dart';
part 'in_singl_state.dart';

class InSinglCubit extends Cubit<InSinglState> {
  InSinglCubit() : super(const InSinglState.initial());

  singlin(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('user', true);
      prefs.setString('email', email);
      prefs.setString('pass', password);
      emit(const InSinglState.success());
    } on FirebaseAuthException catch (e) {
      /// Адилет Байке могул жакты chat gbt кылды 👇////////////////
      if (e.code == 'user-not-found') {
        emit(const InSinglState.error(
            'Пользователь для этого адреса электронной почты не найден'));
      } else if (e.code == 'wrong-password') {
        emit(const InSinglState.error(
            'Для этого пользователя предоставлен неверный пароль.'));
      } else {
        emit(InSinglState.error('Ошибка авторизации: ${e.message}'));
      }
      ////////////////
    }
  }
}
