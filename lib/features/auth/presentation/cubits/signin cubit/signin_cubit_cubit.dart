import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_cubit_state.dart';

class SigninCubitCubit extends Cubit<SigninCubitState> {
  SigninCubitCubit({required this.authRepo}) : super(SigninCubitInitial());

  final AuthRepo authRepo;

  void signInWithEmailAndPassword({
    required String email,
    required String password,
   
  }) async {
    emit(SigninCubitLoading());

    var user = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    
    );
    user.fold(
      (failure) {
        emit(SigninCubitFailure(errorMessage: failure.message));
      },
      (user) {
        emit(SigninCubitSuccess(user: user));
      },
    );
  }
}
