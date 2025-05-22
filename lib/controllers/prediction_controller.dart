import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../preprocess_image.dart';

class PredictionController extends GetxController {
  late Interpreter interpreter;

  @override
  void onInit() {
    super.onInit();
    loadModel();
  }

  void loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/model.tflite');
      print("Model loaded successfully");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<List<String>> loadLabels() async {
    final labelData = await rootBundle.loadString('assets/labels.txt');
    return labelData.split('\n');
  }

  void predict(File image) async {
    final output = await runInference(image, interpreter);
    final labels = await loadLabels();
    final prediction = getTopPrediction(output, labels);
    print("Prediction: $prediction");
  }
}
