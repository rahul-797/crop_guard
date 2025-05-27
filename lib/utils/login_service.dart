import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/controllers/history_controller.dart';
import 'package:crop_guard/models/user/user_model.dart';
import 'package:crop_guard/screens/home_screen.dart';
import 'package:crop_guard/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static late User? user;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  RxBool isLoading = RxBool(false);

  anonymousLogin() async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      User? user = userCredential.user;
      print('Signed in anonymously as: ${user?.uid}');

      try {
        AppUser user = AppUser(
          userId: FirebaseAuth.instance.currentUser!.uid,
          displayName: "Anon",
          email: "",
          createdAt: DateTime.now(),
          photoURL: "",
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(user.toJson());
      } catch (e) {
        print(e);
      }
      isLoading.value = false;
      Get.offAll(() => HomeScreen());
    } catch (e) {
      print('Anonymous sign-in failed: $e');
      isLoading.value = false;
    }
  }

  anonymousLogout() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final historyController = Get.find<HistoryController>();
      historyController.detectionHistory.value = [];
      await deleteUserStorage(uid);
      await FirebaseFirestore.instance.collection("users").doc(uid).delete();
      await auth.signOut();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      print(e);
    }
  }

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
        isLoading.value = false;
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

deleteUserStorage(String uid) async {
  try {
    final profileRef = FirebaseStorage.instance.ref('users/$uid/profile.jpg');
    await profileRef.delete();

    final detectionsRef = FirebaseStorage.instance.ref('users/$uid/detections');
    final ListResult result = await detectionsRef.listAll();

    for (final Reference file in result.items) {
      await file.delete();
    }
  } catch (e) {
    print('Error deleting user storage: $e');
  }
}
