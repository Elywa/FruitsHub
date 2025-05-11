import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/core/services/constants.dart';
import 'package:fruits_hub/core/services/data_base_service.dart';
import 'package:fruits_hub/core/services/fire_base_service.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FireBaseService fireBaseService;
  final DataBaseService dataBaseService;
  AuthRepoImpl({required this.dataBaseService, required this.fireBaseService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await fireBaseService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        "An Error Occured in AuthRepoImpl.createUserWithEmailAndPassword which is: ${e.toString()}",
      );
      return Left(
        ServerFailure('لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await fireBaseService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(UserModel.fromFireBaseAuthUser(user));
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      log(
        "An Error Occured in AuthRepoImpl.signInWithEmailAndPassword which is: ${e.toString()}",
      );
      return Left(
        ServerFailure('لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await fireBaseService.signInWithGoogle();
      var userEntity = UserModel.fromFireBaseAuthUser(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        "An Error Occured in AuthRepoImpl.signInWithGoogle which is: ${e.toString()}",
      );
      return left(
        ServerFailure('لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFaceBook() async {
    User? user;
    try {
      user = await fireBaseService.signInWithFacebook();
      var userEntity = UserModel.fromFireBaseAuthUser(user);
      await addUserData(user: userEntity);

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        "An Error Occured in AuthRepoImpl.signInWithFaceBook which is: ${e.toString()}",
      );
      return left(
        ServerFailure('لقد حدث خطأ غير معروف، يرجى المحاولة مرة أخرى لاحقًا.'),
      );
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseService.addUserData(
      path: Constants.userCollection,
      data: user.toMap(),
    );
  }
}
