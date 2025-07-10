import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/core/errors/server_failure.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ إرسال رابط التحقق إلى بريد المستخدم
      await credential.user?.sendEmailVerification();

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ServerFailure('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ServerFailure('The account already exists for that email.');
      } else {
        throw ServerFailure(e.message ?? 'Unknown Firebase Auth error.');
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

  Future<void> updateProfile({required String uid, String? name, String? email, String? currentPassword, String? newPassword,}) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw ServerFailure('No user is currently signed in.');
    }

    // Determine what needs to be updated
    final hasPasswordChange = newPassword != null && currentPassword != null;
    final hasNameOrEmailChange = (name != null) || (email != null);

    try {
      // Re-authenticate if needed (email or password change)
      if (hasPasswordChange || email != null) {
        if (currentPassword == null) {
          throw ServerFailure(
              'You must enter your current password to re-authenticate.');
        }

        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );

        await user.reauthenticateWithCredential(credential);
      }

      // Update password
      if (hasPasswordChange) {
        await user.updatePassword(newPassword!);
      }

      // Update email
      if (email != null && email != user.email) {
        await user.updateEmail(email);
      }

      // Update Firestore document (name and/or email)
      if (hasNameOrEmailChange) {
        final userDoc = FirebaseFirestore.instance.collection('users').doc(uid);

        final updateData = <String, dynamic>{};
        if (name != null) updateData['name'] = name;
        if (email != null) updateData['email'] = email;

        await userDoc.update(updateData);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          throw ServerFailure('The current password is incorrect.');
        case 'weak-password':
          throw ServerFailure('The new password is too weak.');
        case 'email-already-in-use':
          throw ServerFailure('This email address is already in use.');
        case 'invalid-email':
          throw ServerFailure('The email address is invalid.');
        case 'requires-recent-login':
          throw ServerFailure('Please sign in again to perform this action.');
        default:
          throw ServerFailure(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      throw ServerFailure('Failed to update profile: ${e.toString()}');
    }
  }
  Future<void> logOut() async {
    try {
      // Firebase sign out
      await FirebaseAuth.instance.signOut();

      // Google sign out
      final googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }

      // Facebook sign out (only if logged in)
      final accessToken = await FacebookAuth.instance.accessToken;
      if (accessToken != null) {
        await FacebookAuth.instance.logOut();
      }

    } catch (e) {
      // تأكد أن ServerFailure معرف
      throw ServerFailure('Failed to sign out: ${e.toString()}');
    }
  }


}


