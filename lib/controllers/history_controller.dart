import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../models/detection_history/history_model.dart';

class HistoryController extends GetxController {
  Rx<List<DetectionHistory>> detectionHistory = Rx<List<DetectionHistory>>([]);

  deleteDetectionHistory() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'detectionHistory': [],
    });

    final storageRef = FirebaseStorage.instance.ref().child('users/$userId/detections/');
    final ListResult result = await storageRef.listAll();

    for (var item in result.items) {
      await item.delete();
    }
  }

  Stream<List<DetectionHistory>> detectionHistoryStream() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = FirebaseFirestore.instance.collection('users').doc(uid);

    return docRef.snapshots().map((snapshot) {
      if (!snapshot.exists) return [];

      final data = snapshot.data();
      final historyList = data?['detectionHistory'] as List<dynamic>?;

      if (historyList == null) return [];

      return historyList
          .map((entry) => DetectionHistory.fromJson(Map<String, dynamic>.from(entry)))
          .toList();
    });
  }

  /*
  loadDetectionHistory() async {
    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPloadDetectionHistory");
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
    }
  }
  */
}
