import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/controllers/history_controller.dart';
import 'package:crop_guard/controllers/image_controller.dart';
import 'package:crop_guard/models/user/user_model.dart';
import 'package:crop_guard/screens/camera_screen.dart';
import 'package:crop_guard/screens/prediction_screen.dart';
import 'package:crop_guard/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../models/detection_history/history_model.dart';
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

  GetStorage box = GetStorage();

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome ${FirebaseAuth.instance.currentUser!.displayName!.split(" ").first}"),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => ProfileScreen()),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Detection History", style: TextStyle(fontSize: 24)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        historyController.deleteDetectionHistory();
                      },
                      icon: Icon(Icons.delete_forever),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<DetectionHistory>>(
                stream: historyController.detectionHistoryStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No detection history found.');
                  }

                  final historyList = snapshot.data!;
                  return ListView.builder(
                    itemCount: historyList.length,
                    itemBuilder: (context, index) {
                      final history = historyList[index];
                      return GestureDetector(
                        onTap: () async {
                          final image = await imageController.getCachedImageFile(history.imageURL);
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
                                      'Confidence: ${history.confidence}',
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => CameraScreen()),
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  Future<void> _loadUserData() async {
    final doc =
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    AppUser user = AppUser.fromJson(doc.data()!);
    box.write("userId", user.userId);
    box.write("photoURL", user.photoURL);
    print(user);
  }
}
