import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:fruits_hub/core/utilis/constants.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_auth_service.dart';
import 'package:fruits_hub/core/utilis/services/fire_base/fire_store_service.dart';
import 'package:fruits_hub/core/utilis/services/supabase/subabase_data_base_service.dart';
import 'package:fruits_hub/core/utilis/shared_prefrences.dart';
import 'package:fruits_hub/features/login_view/data/models/token_model.dart';
import 'package:fruits_hub/features/login_view/data/models/user_model.dart';

import 'package:fruits_hub/features/login_view/domain/entities/user_entity.dart';

import '../../../../core/utilis/save_user_locally.dart';
import '../../../../core/utilis/services/data_base_service.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FireAuthService fireBaseAuthService;
  final FireStoreService fireStoreService;
  final SupaBaseDataBaseService supaBaseDataBaseService;

  AuthRepoImpl({
    required this.fireBaseAuthService,
    required this.fireStoreService,
    required this.supaBaseDataBaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;

    try {
      var user = await fireBaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      UserEntity userEntity =
          UserEntity(name: name, email: user.email!, id: user.uid);
      await addUserData(path: kUsers, userEntity: userEntity, id: user.uid);
      addUserDataLocally(userEntity);
      await user.sendEmailVerification();
      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await fireBaseAuthService.signinWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Reload to get the latest emailVerified status
      await user.reload();
      user = FirebaseAuth.instance.currentUser!;

      // Check email verification
      if (!user.emailVerified) {
        // Optionally: sign out user to avoid holding session
        await FirebaseAuth.instance.signOut();
        return left(ServerFailure('Please verify your email before logging in.'));
      }

      UserEntity userEntity = await getUserData(path: kUsers, id: user.uid);
      addUserDataLocally(userEntity);
      return Right(userEntity);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      var user = await fireBaseAuthService.signInWithGoogle();
      UserEntity userEntity =
          UserEntity(name: user.displayName!, email: user.email!, id: user.uid);
      var isUserExists =
          fireStoreService.isDataExists(path: kUsers, id: user.uid);
      if (isUserExists == true) {
        await getUserData(path: kUsers, id: user.uid);
      } else {
        await addUserData(path: kUsers, userEntity: userEntity, id: user.uid);
        addUserDataLocally(userEntity);
      }
      return Right(userEntity);
    } catch (e) {
      if (user != null) {
        await fireBaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() {
    // TODO: implement signinWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<void> addUserData(
      {required String path,
      required UserEntity userEntity,
      required String id}) async {
    await fireStoreService.addData(
        path: path, data: UserModel.fromEntity(userEntity).toJson(), id: id);
  }

  @override
  Future<UserEntity> getUserData(
      {required String path, required String id}) async {
    var result = await fireStoreService.getData(path: path, id: id);
    UserEntity userEntity = (UserModel.fromJson(result)).toEntity();
    return userEntity;
  }

  @override
  Future<void> addUserToken(
      {required String path,
      required String token,
      required String userId}) async {
    await supaBaseDataBaseService.addData(
      path: path,
      data: TokenModel(token: token, userId: userId).toJson(),
    );
    await fireStoreService.addData(
      path: path,
      data: TokenModel(token: token, userId: userId).toJson(),
    );
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    required String uid,
    String? name,
    String? email,
    String? currentPassword,
    String? newPassword,
  }) async {
    try {
      await fireBaseAuthService.updateProfile(
          currentPassword: currentPassword,
          uid: uid,
          name: name,
          newPassword: newPassword);

      return Right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await fireBaseAuthService.logOut();

      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      await fireBaseAuthService.sendPasswordResetEmail(email: email);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
