import 'package:crop_guard/screens/home_screen.dart';
import 'package:crop_guard/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    GetMaterialApp(
      home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : HomeScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
