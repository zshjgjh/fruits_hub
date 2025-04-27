import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/server_failure.dart';

part 'signin_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(String email,String password,String name) async {
    emit(SignUpLoading());
    var result= await authRepo.createUserWithEmailAndPassword(email, password,name);
    result.fold(
            (failure){
              emit(SignUpFailure(errorMessage: failure.errorMessage));
            },
            (userEntity){
              emit(SignUpSuccess(userEntity));
            });
  }


}
