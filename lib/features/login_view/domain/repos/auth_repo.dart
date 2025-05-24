import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword({required String email, required String password,required String name});
  Future<Either<Failure,UserEntity>> signinWithEmailAndPassword({required String email,required String password});
  Future<Either<Failure,UserEntity>> signinWithGoogle();
  Future<Either<Failure,UserEntity>> signinWithFacebook();
  Future<void> addUserData({required String path,required UserEntity userEntity,required String id});
  Future<UserEntity> getUserData({required String path,required String id});
  Future<void> addUserToken({required String path,required String token,required String userId});
}