import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../preprocess_image.dart';

class PredictionController extends GetxController {
  late Interpreter interpreter;
  RxBool isLoading = false.obs;

  Future<void> loadModel() async {
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

  Future<Map<int, String>> predict(File image) async {
    await loadModel();
    final output = await runInference(image, interpreter);
    // final labels = await loadLabels();
    // final prediction = getTopPrediction(output, labels);
    final Map<int, String> prediction = getTopLabel(output);
    print("Prediction: $prediction");
    return prediction;
  }
}
