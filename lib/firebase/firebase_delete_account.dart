import 'package:firebase_auth/firebase_auth.dart';

deleAcc(String password) async {
  final user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: password,
      );

      await user.reauthenticateWithCredential(credential);
      await user.delete();
      print("Аккаунт успешно удалён.");
    } catch (e) {
      print("Ошибка при удалении аккаунта: $e");
    }
  }
}
