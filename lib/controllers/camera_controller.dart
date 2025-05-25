import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraService extends GetxController {
  CameraController? cameraController;
  late List<CameraDescription> cameras;
  late PermissionStatus status;
  RxBool isCameraInitialised = RxBool(false);

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
