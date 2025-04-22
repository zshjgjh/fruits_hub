import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/server_failure.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(String email,String password) async {
    emit(AuthLoading());
    var result= await authRepo.createUserWithEmailAndPassword(email, password);
    result.fold(
            (failure){
              emit(AuthFailure(errorMessage: failure.errorMessage));
            },
            (userEntity){
              emit(AuthSuccess(userEntity));
            });
  }
}
