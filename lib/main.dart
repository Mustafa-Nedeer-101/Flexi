import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flexi/app.dart';
import 'package:flexi/data/repositories/authentication/authentication_repo.dart';
import 'package:flexi/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Todo: Add widgets bindings
  WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init local storage
  await GetStorage.init();

  // Todo: Await native splash
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);

  // Todo: Initialize firebase & Authenticatin Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepo()),
  );

  // Only activate App Check on supported platforms
  if (kIsWeb || Platform.isAndroid || Platform.isIOS) {
    await FirebaseAppCheck.instance.activate(
      webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
      appleProvider: AppleProvider.appAttest,
      androidProvider: AndroidProvider.debug,
    );
  }

  runApp(const App());
}
