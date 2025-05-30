import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
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
import '../utils/login_service.dart';
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
  final loginController = Get.find<LoginController>();
  String name = "Anon";

  @override
  void initState() {
    if (!FirebaseAuth.instance.currentUser!.isAnonymous) {
      name = FirebaseAuth.instance.currentUser!.displayName!.split(" ").first;
    }
    super.initState();
  }

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
                    "Welcome $name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  !FirebaseAuth.instance.currentUser!.isAnonymous
                      ? profileWidget()
                      : IconButton(
                        onPressed: () {
                          showLogoutConfirmDialog();
                        },
                        icon: Icon(Icons.logout, size: 28),
                      ),
                ],
              ),
              SizedBox(height: 18),
              Text("Recent disease detections", style: TextStyle(fontSize: 18)),
              !FirebaseAuth.instance.currentUser!.isAnonymous
                  ? recentWidget()
                  : Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 36),
                      child: Column(
                        children: [
                          Image.asset("assets/history.png", width: 48, color: Colors.black54),
                          SizedBox(height: 4),
                          Text("To see history login"),
                        ],
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
          if (!cameraService.status.isGranted) {
            cameraService.status = await Permission.camera.request();
          }
          if (cameraService.status.isGranted && cameraService.isCameraInitialised.value) {
            Get.to(() => CameraScreen());
          } else if (!cameraService.isCameraInitialised.value) {
            if (cameraService.status.isGranted) {
              cameraService.cameras = await availableCameras();
              cameraService.cameraController = Get.put(
                CameraController(
                  cameraService.cameras[0],
                  ResolutionPreset.ultraHigh,
                  enableAudio: false,
                ),
              );
              await cameraService.cameraController!.initialize();
              cameraService.isCameraInitialised.value = true;
              Get.to(() => CameraScreen());
            } else {
              showPermissionDialog();
              return;
            }
          } else {
            showPermissionDialog();
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  recentWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: StreamBuilder<List<DetectionHistory>>(
          stream: historyController.detectionHistoryStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: Colors.green);
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48, bottom: 16),
                      child: Image.asset("assets/emptyBox.png", height: 100),
                    ),
                  ),
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
                                            color: Colors.green,
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
                                          DateFormat('MMM dd, yyyy').format(history.createdAt),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  profileWidget() {
    return GestureDetector(
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
              return Center(child: CircularProgressIndicator(color: Colors.green));
            }
            String url = "";
            if (snapshot.data != null &&
                snapshot.data!.data() != null &&
                snapshot.data!.data()!.containsKey('photoURL')) {
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
    );
  }

  showLogoutConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Your data is safe.\nLogout from this account?'),
          actions: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(width: 2),
            GestureDetector(
              onTap: () {
                if (FirebaseAuth.instance.currentUser!.isAnonymous) {
                  loginController.anonymousLogout();
                } else {
                  loginController.logout();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Permission required'),
          content: const Text(
            "To capture and analyze images, this app requires access to your camera.",
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(width: 2),
            GestureDetector(
              onTap: () {
                openAppSettings();
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
