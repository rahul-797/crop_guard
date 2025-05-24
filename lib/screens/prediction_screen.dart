import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/controllers/history_controller.dart';
import 'package:crop_guard/utils/cache.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/detection_history/history_model.dart';
import '../utils/plant_data.dart';

class PredictionScreen extends StatefulWidget {
  final bool isUploaded;
  final File image;
  final int predictedIndex;
  final double predictedConfidence;
  final String predictedText;
  const PredictionScreen({
    super.key,
    required this.isUploaded,
    required this.image,
    required this.predictedIndex,
    required this.predictedText,
    required this.predictedConfidence,
  });

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final historyController = Get.find<HistoryController>();

  @override
  void initState() {
    super.initState();
    if (!widget.isUploaded) {
      _uploadDetection();
    }
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
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final bool isCollapsed =
                    constraints.maxHeight <= kToolbarHeight + MediaQuery.of(context).padding.top;

                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title:
                        isCollapsed
                            ? Text(
                              widget.predictedText,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                            : null,
                    background: Image.file(widget.image, fit: BoxFit.cover),
                  ),
                );
              },
            ),
            // flexibleSpace: ClipRRect(
            //   borderRadius: const BorderRadius.only(
            //     bottomLeft: Radius.circular(24),
            //     bottomRight: Radius.circular(24),
            //   ),
            //   child: FlexibleSpaceBar(
            //     background: Image.file(File(widget.image.path), fit: BoxFit.cover),
            //   ),
            // ),
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
                  data[widget.predictedIndex].containsKey('info')
                      ? Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ℹ️ Info',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(data[widget.predictedIndex]['info']!),
                            ],
                          ),
                        ),
                      )
                      : Container(),
                  data[widget.predictedIndex].containsKey('treatment')
                      ? Column(
                        children: [
                          const SizedBox(height: 12),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '🧪 Treatment',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(data[widget.predictedIndex]['treatment']!),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                      : Container(),
                  data[widget.predictedIndex].containsKey('prevention')
                      ? Column(
                        children: [
                          const SizedBox(height: 12),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '🛡️ Prevention Strategies',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(data[widget.predictedIndex]['prevention']!),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                      : Container(),
                  data[widget.predictedIndex].containsKey('care')
                      ? Column(
                        children: [
                          const SizedBox(height: 12),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '🌿 Care Tips',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(data[widget.predictedIndex]['care']!),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _uploadImageToStorage(File imageFile, String userId) async {
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

  _addDetectionHistory(DetectionHistory newEntry) async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    await userDoc.update({
      'detectionHistory': FieldValue.arrayUnion([newEntry.toJson()]),
    });
  }

  _uploadDetection() async {
    final url = await _uploadImageToStorage(widget.image, FirebaseAuth.instance.currentUser!.uid);
    await cacheLocalFileAsNetworkImage(widget.image, url);

    await _addDetectionHistory(
      DetectionHistory(
        imageURL: url,
        confidence: widget.predictedConfidence,
        index: widget.predictedIndex,
        createdAt: DateTime.now(),
      ),
    );
  }
}
