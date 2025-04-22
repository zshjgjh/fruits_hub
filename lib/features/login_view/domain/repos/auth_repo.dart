import 'package:dartz/dartz.dart';

import '../../../../core/errors/server_failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo{
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(String email,String password);
  Future<Either<Failure,void>> signinWithEmailAndPassword(String email,String password);
}