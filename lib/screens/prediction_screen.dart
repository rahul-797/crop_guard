import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/detection_history/history_model.dart';

class PredictionScreen extends StatefulWidget {
  final XFile image;
  final int predictedIndex;
  final double predictedConfidence;
  final String predictedText;
  const PredictionScreen({
    super.key,
    required this.image,
    required this.predictedIndex,
    required this.predictedText,
    required this.predictedConfidence,
  });

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  void initState() {
    super.initState();
    _uploadDetection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: Get.height * 0.35,
            collapsedHeight: kToolbarHeight,
            centerTitle: true,
            leading: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: FlexibleSpaceBar(
                background: Image.file(File(widget.image.path), fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.predictedText, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  Text(
                    "Confidence: ${widget.predictedConfidence.toStringAsFixed(3)}",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '🧪 Treatment',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Biological:\nIf the soil is really dry, you may immerse the whole pot in water until it is evenly moist.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '🛡️ Prevention Strategies',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Biological:\nIf the soil is really dry, you may immerse the whole pot in water until it is evenly moist.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> uploadImageToStorage(File imageFile, String userId) async {
    try {
      final String fileName = const Uuid().v4();
      final storageRef = FirebaseStorage.instance.ref().child(
        'users/$userId/detections/$fileName.jpg',
      );
      final uploadTask = await storageRef.putFile(imageFile);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }

  Future<void> addDetectionHistory(DetectionHistory newEntry) async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await userDoc.update({
      'detectionHistory': FieldValue.arrayUnion([newEntry.toJson()]),
    });
  }

  void _uploadDetection() async {
    final url = await uploadImageToStorage(
      File(widget.image.path),
      FirebaseAuth.instance.currentUser!.uid,
    );
    addDetectionHistory(
      DetectionHistory(
        imageURL: url,
        confidence: widget.predictedConfidence,
        index: widget.predictedIndex,
        createdAt: DateTime.now(),
      ),
    );
  }
}
