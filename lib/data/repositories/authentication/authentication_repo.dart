import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi/data/repositories/user/user_repo.dart';
import 'package:flexi/features/authentication/screens/login/login.dart';
import 'package:flexi/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flexi/features/authentication/screens/sign_up/verify_email.dart';
import 'package:flexi/navigation_menu.dart';
import 'package:flexi/utils/local_storage/sorage_utility.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  // Varialbes
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? instanceUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  @override
  void onInit() {
    // Stream Subscriber
    // ignore: unused_local_variable
    StreamSubscription<User?> userSubcribtion =
        FirebaseAuth.instance.userChanges().listen((user) {
      instanceUser = user;
    });
    super.onInit();
  }

  // Function to show Relavent Screen
  screenRedirect() async {
    User? user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        // Initialize user specific storage
        await ULocalStorage.init(user.uid);

        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmail(
              email: FirebaseAuth.instance.currentUser?.email,
            ));
      }
    } else {
      // Local Storage
      if (deviceStorage.read('isSecondTime') == true) {
        Get.offAll(() => const Login());
      } else {
        Get.offAll(() => const OnBoarding());
      }
    }
  }

  // Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // ReAuthentication
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      // Create Auth credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Login with google
  Future<UserCredential?> signinWithGoogle() async {
    try {
      // Authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Get the auth detail
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // return user credential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Register User
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Email Verification
  Future<void> sendEmailVerification() async {
    try {
      _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Logout User
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Delete account
  Future<void> deleteAccount() async {
    try {
      await UserRepo.instance.removeUserRecord(_auth.currentUser!.uid);
      await FirebaseAuth.instance.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw e.code;
    } on FirebaseException catch (e) {
      throw e.code;
    } on FormatException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.code;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
