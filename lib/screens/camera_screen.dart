import 'dart:io';

import 'package:camera/camera.dart';
import 'package:crop_guard/controllers/camera_controller.dart';
import 'package:crop_guard/controllers/image_controller.dart';
import 'package:crop_guard/controllers/prediction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final cameraService = Get.find<CameraService>();
  final imageController = Get.find<ImageController>();
  final predictionController = Get.find<PredictionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (predictionController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.green));
        } else {
          return Stack(
            children: [
              Positioned.fill(child: CameraPreview(cameraService.cameraController!)),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: imageController.pickFromGallery,
                        child:
                            imageController.selectedImage.value != null
                                ? ClipOval(
                                  child: Image.file(
                                    File(imageController.selectedImage.value!.path),
                                    width: 48,
                                    height: 48,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                : CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.image_outlined),
                                ),
                      ),
                      GestureDetector(
                        onTap:
                            imageController.captureDisable.value
                                ? null
                                : imageController.captureImage,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: false,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Icon(Icons.navigate_next, size: 36),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
