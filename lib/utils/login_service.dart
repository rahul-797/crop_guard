import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/controllers/history_controller.dart';
import 'package:crop_guard/models/user/user_model.dart';
import 'package:crop_guard/screens/home_screen.dart';
import 'package:crop_guard/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static late User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  RxBool isLoading = RxBool(false);

  login() async {
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      isLoading.value = true;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;

        try {
          AppUser user = AppUser(
            userId: FirebaseAuth.instance.currentUser!.uid,
            displayName: FirebaseAuth.instance.currentUser!.displayName ?? '',
            email: FirebaseAuth.instance.currentUser!.email ?? '',
            createdAt: DateTime.now(),
            photoURL: "",
          );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get()
              .then((docSnapshot) async {
                if (!docSnapshot.exists) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set(user.toJson());
                }
              });
        } catch (e) {
          print(e);
        }
        isLoading.value = false;
        Get.offAll(() => HomeScreen());
      } catch (e) {
        print(e);
      }
    }
  }

  logout() async {
    try {
      final historyController = Get.find<HistoryController>();
      historyController.detectionHistory.value = [];
      await googleSignIn.signOut();
      await auth.signOut();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      print(e);
    }
  }
}
