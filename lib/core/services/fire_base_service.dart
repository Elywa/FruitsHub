import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is Weak Password: ${e.toString()}",
        );
        throw CustomException('الرقم السري ضعيف جدا.');
      } else if (e.code == 'email-already-in-use') {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is Email Already in Use: ${e.toString()}",
        );
        throw CustomException('البريد الالكتروني مستخدم من قبل.');
      } else if (e.code == "network-request-failed") {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is Network Error: ${e.toString()}",
        );
        throw CustomException('خطأ في الاتصال بالانترنت.');
      } else if (e.code == 'invalid-email') {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is Invalid Email: ${e.toString()}",
        );
        throw CustomException('البريد الالكتروني غير صحيح.');
      } else if (e.code == 'operation-not-allowed') {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is operation-not-allowed: ${e.toString()}",
        );
        throw CustomException('خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.');
      } else if (e.code == 'user-disabled') {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is user-disabled: ${e.toString()}",
        );
        throw CustomException('هذا الحساب معطل، يرجى التواصل مع الدعم.');
      } else if (e.code == 'user-not-found') {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is user-not-found: ${e.toString()}",
        );
        throw CustomException('هذا الحساب غير موجود، يرجى التواصل مع الدعم.');
      } else {
        log(
          "An Error Occured in FireBaseService.createUserWithEmailAndPassword which is: ${e.toString()} and code: ${e.code}",
        );
        throw CustomException(
          'لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى فى وقت لاحق.',
        );
      }
    } catch (e) {
      log(
        "An Error Occured in FireBaseService.creatwUserWithEmailAndPassword which is: ${e.toString()}",
      );
      throw CustomException(
        'لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          log('FireBase Error in signInWithEmailAndPassword: Wrong password.');
          throw CustomException(
            'حدث خطأ في عملية تسجيل الدخول: كلمة المرور غير صحيحه.',
          );
        case 'invalid-email':
          log('FireBase Error in signInWithEmailAndPassword: Wrong email ');
          throw CustomException(
            'حدث خطأ في عملية تسجيل الدخول: البريد الالكتروني غير صحيح.',
          );
        case 'network-request-failed':
          log('FireBase Error in signInWithEmailAndPassword: Network error.');
          throw CustomException(
            'حدث خطأ في عملية تسجيل الدخول: خطأ في الاتصال بالانترنت.',
          );
        default:
          log(
            'FireBase Error in default case signInWithEmailAndPassword: ${e.toString()} and code: ${e.code}',
          );
          throw CustomException(
            'حدث خطأ غير معروف في عملية تسجيل الدخول، يرجى المحاولة لاحقًا.',
          );
      }
    } catch (e) {
      log(
        'FireBase Error in final catch  signInWithEmailAndPassword: ${e.toString()} ',
      );
      throw CustomException(
        'لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
