import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

/// Load and preprocess image
Future<Float32List> preprocessImage(File imageFile) async {
  final rawBytes = await imageFile.readAsBytes();
  final img.Image? originalImage = img.decodeImage(rawBytes);

  if (originalImage == null) {
    throw Exception("Failed to decode image");
  }

  final img.Image resizedImage = img.copyResize(originalImage, width: 224, height: 224);

  final Float32List input = Float32List(1 * 224 * 224 * 3);
  int index = 0;

  for (int y = 0; y < 224; y++) {
    for (int x = 0; x < 224; x++) {
      final pixel = resizedImage.getPixel(x, y);
      input[index++] = pixel.r / 255.0;
      input[index++] = pixel.g / 255.0;
      input[index++] = pixel.b / 255.0;
    }
  }

  return input;
}

/// Reshape [Float32List] into nested List structure: [1][224][224][3]
List<List<List<List<double>>>> reshapeInput(Float32List input) {
  final result = List.generate(
    1,
    (_) => List.generate(224, (_) => List.generate(224, (_) => List.filled(3, 0.0))),
  );

  int index = 0;
  for (int y = 0; y < 224; y++) {
    for (int x = 0; x < 224; x++) {
      result[0][y][x][0] = input[index++]; // R
      result[0][y][x][1] = input[index++]; // G
      result[0][y][x][2] = input[index++]; // B
    }
  }

  return result;
}

/// Run inference and return raw output scores
Future<List<double>> runInference(File imageFile, Interpreter interpreter) async {
  final preprocessed = await preprocessImage(imageFile);
  final input = reshapeInput(preprocessed);

  final outputShape = interpreter.getOutputTensor(0).shape; // e.g. [1, 10]
  final output = List.generate(outputShape[0], (_) => List.filled(outputShape[1], 0.0));

  interpreter.run(input, output);

  return List<double>.from(output[0]);
}

String getTopPrediction(List<double> output, List<String> labels) {
  int maxIdx = 0;
  double maxVal = output[0];

  for (int i = 1; i < output.length; i++) {
    if (output[i] > maxVal) {
      maxVal = output[i];
      maxIdx = i;
    }
  }

  return labels[maxIdx];
}
