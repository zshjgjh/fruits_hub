import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthService {
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

  Future<User> signinWithEmailAndPassword({required String email, required String password}) async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential.user!;
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

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
  bool isUserSignin()  {
    return FirebaseAuth.instance.currentUser !=null;
}

}
