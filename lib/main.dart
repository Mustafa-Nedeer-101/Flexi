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
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo: Init local storage
  await GetStorage.init();

  // Todo: Await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize firebase & Authenticatin Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepo()),
  );

  // Todo: Init authentication
  runApp(const App());
}
