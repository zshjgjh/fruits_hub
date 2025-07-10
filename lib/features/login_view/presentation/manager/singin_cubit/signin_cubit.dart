import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/login_view/data/repos_impl/auth_repo_impl.dart';
import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/login_view/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit({required this.authRepo}) : super(SigninInitial());

  final AuthRepo authRepo;
  Future<void> signinWithEmailAndPassword({required String email,required String password}) async {
    emit(SigninLoading());
    var result= await authRepo.signinWithEmailAndPassword(email: email, password: password,);
    result.fold(
            (failure){
          emit(SigninFailure(errorMessage: failure.errorMessage));
        },
            (userEntity){
          emit(SigninSuccess(userEntity:userEntity ));
        });
  }

  Future<void> signinWithGoogle() async {
    emit(SigninLoading());
    var result= await authRepo.signinWithGoogle();
    result.fold(
            (failure){
          emit(SigninFailure(errorMessage: failure.errorMessage));
        },
            (userEntity){
          emit(SigninSuccess(userEntity: userEntity));
        });
  }
  Future<void> signinWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signinWithFacebook();
    result.fold(
            (failure) {
          emit(SigninFailure(errorMessage: failure.errorMessage));
        },
            (userEntity) {
          emit(SigninSuccess(userEntity: userEntity));
        });
  }

    Future<void> updateProfile({required String uid, String? name, String? email, String? currentPassword, String? newPassword,}) async {
      emit(SigninLoading());
      var result= await authRepo.updateProfile(
          uid:uid,
      name:name,
      email: email,
      newPassword:newPassword,
        currentPassword:currentPassword,
      );
      result.fold(
              (failure){
            emit(SigninFailure(errorMessage: failure.errorMessage));
          },
              (r){
            emit(updateProfileSuccess());
          });
  }


  Future<void> logOut() async {
    emit(SigninLoading());
    var result= await authRepo.logout();
    result.fold(
            (failure){
          emit(SigninFailure(errorMessage: failure.errorMessage));
        },
            (r){

        });
  }
}
