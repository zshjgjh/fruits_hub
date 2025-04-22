import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_base_auth_service.dart';
import 'package:fruits_hub/features/login_view/data/models/user_model.dart';

import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';

import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  final FireBaseAuthService fireBaseAuthService;

  AuthRepoImpl({required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password) async {
   try {
     var result=await fireBaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
     UserModel userModel= UserModel.fromFirebaseUser(result);
     UserEntity userEntity= userModel.toEntity();
     return right(userEntity);
   } catch (e) {
     return left(ServerFailure(e.toString()));
   }
   
  }

  @override
  Future<Either<Failure, void>> signinWithEmailAndPassword(String email, String password) {
    // TODO: implement signinWithEmailAndPassword
    throw UnimplementedError();
  }

}