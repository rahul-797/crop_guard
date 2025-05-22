import 'dart:io';

import 'package:crop_guard/controllers/camera_controller.dart';
import 'package:crop_guard/controllers/prediction_controller.dart';
import 'package:crop_guard/screens/prediction_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  RxBool captureDisable = false.obs;
  final cameraService = Get.find<CameraService>();
  final predictionController = PredictionController();

  Future<void> pickFromGallery() async {
    predictionController.isLoading.value = true;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = image;
      final Map<String, dynamic> predictedVal = await predictionController.predict(
        File(image.path),
      );
      predictionController.isLoading.value = false;
      Get.to(
        () => PredictionScreen(
          image: image,
          predictedIndex: predictedVal['index'],
          predictedText: predictedVal['label'],
          predictedConfidence: predictedVal['confidence'],
        ),
      );
    }
  }

  Future<void> captureImage() async {
    if (captureDisable.value) return;
    captureDisable.value = true;
    predictionController.isLoading.value = true;

    try {
      final XFile? photo = await cameraService.takePicture();

      if (photo != null) {
        selectedImage.value = photo;
        final Map<String, dynamic> predictedVal = await predictionController.predict(
          File(photo.path),
        );
        predictionController.isLoading.value = false;
        captureDisable.value = false;
        Get.to(
          () => PredictionScreen(
            image: photo,
            predictedIndex: predictedVal['index'],
            predictedText: predictedVal['label'],
            predictedConfidence: predictedVal['confidence'],
          ),
        );
      }
    } finally {
      captureDisable.value = false;
    }
  }
}
