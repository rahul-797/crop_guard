import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService extends GetxController {
  CameraController? cameraController;
  late List<CameraDescription> cameras;
  late PermissionStatus status;
  RxBool isCameraInitialised = RxBool(false);

  Future<void> initCamera() async {
    status = await Permission.camera.status;
    if (!status.isGranted) {
      status = await Permission.camera.request();
      if (status.isDenied) {
        Get.snackbar(
          'Access Restricted',
          'Camera permission is needed to function properly.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          borderRadius: 8,
          margin: const EdgeInsets.all(12),
          duration: Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOut,
          icon: Icon(Icons.error, color: Colors.white),
        );
        return;
      }
    }
    if (status.isPermanentlyDenied) {
      Get.defaultDialog(
        title: 'Permission Required',
        middleText: 'Camera permission is permanently denied. Please enable it from settings.',
        textConfirm: 'Open Settings',
        onConfirm: () {
          openAppSettings();
          Get.back();
        },
        textCancel: 'Cancel',
      );
      return;
    }
    cameras = await availableCameras();
    cameraController = Get.put(
      CameraController(cameras[0], ResolutionPreset.ultraHigh, enableAudio: false),
    );
    await cameraController!.initialize();
    isCameraInitialised.value = true;
  }

  Future<XFile?> takePicture() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return null;
    }
    try {
      return await cameraController!.takePicture();
    } catch (e) {
      print("Error taking picture: $e");
      return null;
    }
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
