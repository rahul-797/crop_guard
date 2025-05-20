import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/camera_controller.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final CameraService cameraService = Get.find();
  XFile? _selectedImage;

  Future<void> _pickFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<void> _captureImage() async {
    final XFile? photo = await cameraService.takePicture();
    if (photo != null) {
      setState(() {
        _selectedImage = photo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!cameraService.isInitialized.value) {
          cameraService.initCamera();
          return Center(child: CircularProgressIndicator());
        }
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
                    GestureDetector(onTap: _pickFromGallery, child: mediaAvatar()),
                    GestureDetector(
                      onTap: _captureImage,
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
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 24,
                      child: Icon(Icons.navigate_next, size: 36),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  mediaAvatar() {
    return _selectedImage != null
        ? ClipOval(
          child: Image.file(File(_selectedImage!.path), width: 48, height: 48, fit: BoxFit.cover),
        )
        : CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(Icons.image_outlined),
        );
  }
}
