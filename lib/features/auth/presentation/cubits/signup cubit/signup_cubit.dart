import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart'
    show UserEntity;
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupInitial());
  final AuthRepo authRepo;

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoading());
    var result = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(failure.message));
      },
      (success) {
        emit(SignupSuccess(success));
      },
    );
  }
}
