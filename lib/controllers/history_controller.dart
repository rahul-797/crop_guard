import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/detection_history/history_model.dart';

class HistoryController extends GetxController {
  Rx<List<DetectionHistory>> detectionHistory = Rx<List<DetectionHistory>>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadDetectionHistory();
  }

  loadDetectionHistory() async {
    isLoading.value = true;
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final snapshot = await docRef.get();

    if (snapshot.exists) {
      final data = snapshot.data();
      if (data!['detectionHistory'] == []) {
        detectionHistory.value = [];
      }
      final historyList = data['detectionHistory'] as List<dynamic>?;

      detectionHistory.value =
          historyList!
              .map((entry) => DetectionHistory.fromJson(Map<String, dynamic>.from(entry)))
              .toList();
      print(detectionHistory.value);
      isLoading.value = false;
    }
  }
}
