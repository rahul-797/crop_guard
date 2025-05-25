import 'package:crop_guard/controllers/camera_controller.dart';
import 'package:crop_guard/controllers/prediction_controller.dart';
import 'package:crop_guard/screens/home_screen.dart';
import 'package:crop_guard/screens/login_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(androidProvider: AndroidProvider.debug);
  Get.put(CameraService());
  Get.put(PredictionController());
  runApp(
    GetMaterialApp(
      home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : HomeScreen(),
      theme: ThemeData(textTheme: GoogleFonts.ubuntuTextTheme()),
      debugShowCheckedModeBanner: false,
    ),
  );
}
