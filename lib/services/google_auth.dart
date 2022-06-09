import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'api_service_auth.dart';

class GoogleAuth {
  static Future<Object?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error here
          return Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
              "account-exists-with-different-credential",
              icon: const Icon(Icons.error, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 7));
        } else if (e.code == 'invalid-credential') {
          // handle the error here
          Get.snackbar("NEXTWAVE XPRESS NOTIFICATION", "invalid-credential",
              icon: const Icon(Icons.error, color: Colors.red),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 7));
        }
      } catch (e) {
        // handle the error here
        Get.snackbar(
          "NEXTWAVE XPRESS NOTIFICATION",
          "an error has occured! try later",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
        );
      }
    }

    
    /// we first check if T | for this case the email
    bool verify = await AuthentificationApiService.checkTheExistanceOfEmail(
      user!.email.toString(),
    );

    if (verify) {
      return user.displayName;
    } else {
      /// before the retrurn we should send the google user infos to the api, collect the registration token and store it in
      /// sharedPreference, to keep him logged in

      await AuthentificationApiService.register(user.displayName.toString(),
          user.phoneNumber.toString(), user.email.toString(), 'password');

      Get.snackbar(
        "NEXTWAVE XPRESS NOTIFICATION",
        "your account had been created successfully !",
        icon: const Icon(Icons.check, color: Colors.green),
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 4),
      );
      return user.displayName;
    }
  }
}
