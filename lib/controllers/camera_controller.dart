import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraService extends GetxController {
  CameraController? cameraController;
  late List<CameraDescription> cameras;
  RxBool isInitialized = false.obs;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = Get.put(CameraController(cameras[0], ResolutionPreset.ultraHigh));
    await cameraController!.initialize();
    isInitialized.value = true;
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
