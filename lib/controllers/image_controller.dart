import 'dart:io';

import 'package:crop_guard/controllers/camera_controller.dart';
import 'package:crop_guard/controllers/prediction_controller.dart';
import 'package:crop_guard/screens/prediction_screen.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  final IMAGE_WIDTH = 1024;

  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  RxBool captureDisable = false.obs;
  final cameraService = Get.find<CameraService>();
  final predictionController = Get.put(PredictionController());

  Future<void> pickFromGallery() async {
    predictionController.isLoading.value = true;
    final ImagePicker picker = ImagePicker();
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final bytes = await image.readAsBytes();

      final originalImage = img.decodeImage(bytes);
      if (originalImage == null) throw Exception('Could not decode image');

      final resizedImage = img.copyResize(originalImage, width: IMAGE_WIDTH);

      final resizedBytes = img.encodeJpg(resizedImage, quality: 90);

      final tempDir = Directory.systemTemp;
      final fileName = 'resized_${image.name}';
      final resizedFile = File('${tempDir.path}/$fileName');

      await resizedFile.writeAsBytes(resizedBytes);

      image = XFile(resizedFile.path);

      selectedImage.value = image;
      final Map<String, dynamic> predictedVal = await predictionController.predict(
        File(image.path),
      );
      predictionController.isLoading.value = false;
      Get.to(
        () => PredictionScreen(
          image: image!,
          predictedIndex: predictedVal['index'],
          predictedText: predictedVal['label'],
          predictedConfidence: predictedVal['confidence'],
        ),
      );
    } catch (e) {
      print('Error picking image: $e');
      return null;
    }
  }

  Future<void> captureImage() async {
    if (captureDisable.value) return;
    captureDisable.value = true;
    predictionController.isLoading.value = true;

    try {
      XFile? photo = await cameraService.takePicture();

      if (photo == null) return;
      final bytes = await photo.readAsBytes();

      final originalImage = img.decodeImage(bytes);
      if (originalImage == null) throw Exception('Could not decode image');

      final resizedImage = img.copyResize(originalImage, width: IMAGE_WIDTH);

      final resizedBytes = img.encodeJpg(resizedImage, quality: 90);

      final tempDir = Directory.systemTemp;
      final fileName = 'resized_${photo.name}';
      final resizedFile = File('${tempDir.path}/$fileName');

      await resizedFile.writeAsBytes(resizedBytes);

      photo = XFile(resizedFile.path);

      selectedImage.value = photo;
      final Map<String, dynamic> predictedVal = await predictionController.predict(
        File(photo.path),
      );
      predictionController.isLoading.value = false;
      captureDisable.value = false;
      Get.to(
        () => PredictionScreen(
          image: photo!,
          predictedIndex: predictedVal['index'],
          predictedText: predictedVal['label'],
          predictedConfidence: predictedVal['confidence'],
        ),
      );
    } finally {
      predictionController.isLoading.value = false;
      captureDisable.value = false;
    }
  }
}
