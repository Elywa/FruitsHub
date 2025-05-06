part of 'signin_cubit_cubit.dart';

@immutable
sealed class SigninCubitState {}

final class SigninCubitInitial extends SigninCubitState {}

final class SigninCubitLoading extends SigninCubitState {}

final class SigninCubitSuccess extends SigninCubitState {
  final UserEntity user;
  SigninCubitSuccess({required this.user});
}

final class SigninCubitFailure extends SigninCubitState {
  final String errorMessage;

  SigninCubitFailure({required this.errorMessage});
}
