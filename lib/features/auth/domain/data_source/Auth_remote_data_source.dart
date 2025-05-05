import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
