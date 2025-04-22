import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/server_failure.dart';

class FireBaseAuthService {
  Future<User> createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ServerFailure('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ServerFailure('The account already exists for that email.');
      } else {
        throw ServerFailure(e.toString());
      }
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  Future<void> signinWithEmailAndPassword({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ServerFailure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ServerFailure('Wrong password provided for that user.');
      } else {
        throw ServerFailure(e.toString());
      }
    }catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
