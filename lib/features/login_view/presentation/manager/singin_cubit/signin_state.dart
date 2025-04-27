part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}
final class SigninLoading extends SigninState {}

final class SigninFailure extends SigninState {
  final String errorMessage;

  SigninFailure({required this.errorMessage});
}
final class SigninSuccess extends SigninState {
  final UserEntity userEntity;

  SigninSuccess({required this.userEntity});
}
