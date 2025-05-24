import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/controllers/camera_controller.dart';
import 'package:crop_guard/controllers/history_controller.dart';
import 'package:crop_guard/controllers/image_controller.dart';
import 'package:crop_guard/screens/camera_screen.dart';
import 'package:crop_guard/screens/prediction_screen.dart';
import 'package:crop_guard/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/detection_history/history_model.dart';
import '../utils/cache.dart';
import '../utils/preprocess_image.dart';

BorderRadius splitBorder(int index) {
  return index == 0
      ? BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))
      : BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final historyController = Get.put(HistoryController());
  final imageController = Get.put(ImageController());
  final cameraService = Get.find<CameraService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome ${FirebaseAuth.instance.currentUser!.displayName!.split(" ").first}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => ProfileScreen()),
                    child: SizedBox(
                      height: 48,
                      width: 48,
                      child: StreamBuilder(
                        stream:
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .snapshots(),
                        builder: (query, snapshot) {
                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          String url = "";
                          if (snapshot.hasData && snapshot.data!.data()!.containsKey('photoURL')) {
                            url = snapshot.data!.data()!['photoURL'];
                          }
                          return url == ""
                              ? Image.asset("assets/profile.png")
                              : CircleAvatar(
                                radius: 24,
                                backgroundImage: CachedNetworkImageProvider(url),
                                backgroundColor: Colors.grey[200],
                              );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text("Recent disease detections", style: TextStyle(fontSize: 18)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: StreamBuilder<List<DetectionHistory>>(
                    stream: historyController.detectionHistoryStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(child: Image.asset("assets/emptyBox.png", height: 100)),
                            Text("No data found."),
                          ],
                        );
                      }
                      final historyList = snapshot.data!;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: historyList.length,
                              itemBuilder: (context, index) {
                                final history = historyList[index];
                                return GestureDetector(
                                  onTap: () async {
                                    final image = await getCachedImageFile(history.imageURL);
                                    Get.to(
                                      () => PredictionScreen(
                                        isUploaded: true,
                                        image: image,
                                        predictedIndex: history.index,
                                        predictedText: getLabelFromIndex(history.index),
                                        predictedConfidence: history.confidence,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 6),
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(1, 2),
                                          spreadRadius: 0.1,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: history.imageURL,
                                            placeholder:
                                                (context, url) => Center(
                                                  child: SizedBox(
                                                    height: 36,
                                                    width: 36,
                                                    child: CircularProgressIndicator(
                                                      strokeCap: StrokeCap.round,
                                                    ),
                                                  ),
                                                ),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                            height: 72,
                                            width: 72,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getLabelFromIndex(history.index),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Confidence: ${(history.confidence * 100).toStringAsFixed(0)}%',
                                                style: const TextStyle(fontSize: 12),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const Icon(Icons.calendar_today, size: 14),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    DateFormat(
                                                      'MMM dd, yyyy',
                                                    ).format(history.createdAt),
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                historyController.deleteDetectionHistory();
                              },
                              icon: Icon(Icons.delete, color: Colors.white),
                              label: Text("Delete history"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red, // red background
                                foregroundColor: Colors.white, // white text
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          cameraService.status = await Permission.camera.status;
          if (!cameraService.isCameraInitialised.value) {
            await cameraService.initCamera();
          }
          if (cameraService.status.isGranted) {
            Get.to(() => CameraScreen());
          } else if (cameraService.status.isDenied) {
            await cameraService.initCamera();
          } else {
            Get.defaultDialog(
              title: 'Permission Required',
              middleText:
                  'Camera permission is permanently denied. Please enable it from settings.',
              textConfirm: 'Open Settings',
              onConfirm: () {
                openAppSettings();
                Get.back();
              },
              textCancel: 'Cancel',
            );
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
