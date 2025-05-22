import 'package:crop_guard/controllers/camera_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  final cameraService = Get.find<CameraService>();

  Future<void> pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      selectedImage.value = image;
    }
  }

  Future<void> captureImage() async {
    final XFile? photo = await cameraService.takePicture();
    if (photo != null) {
      selectedImage.value = photo;
    }
  }
}
