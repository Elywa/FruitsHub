import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

class FireBaseService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException('الرقم السري ضعيف جدا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الالكتروني مستخدم من قبل.');
      } else {
        throw CustomException(
          'لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.',
        );
      }
    } catch (e) {
      throw CustomException(
        'لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.',
      );
    }
  }
}
