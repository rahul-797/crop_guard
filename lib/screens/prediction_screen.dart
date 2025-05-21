import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tflite_flutter/tflite_flutter.dart';

import '../preprocess_image.dart';

late Interpreter interpreter;
String? predicted;

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

class PredictionScreen extends StatefulWidget {
  final XFile image;
  const PredictionScreen({super.key, required this.image});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  void initState() {
    super.initState();
    loadModel();
  }

  void predict(File image) async {
    final output = await runInference(image, interpreter);
    final labels = await loadLabels();
    final prediction = getTopPrediction(output, labels);
    print("Prediction: $prediction");
    setState(() {
      predicted = prediction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Viewer")),
      body: Column(
        children: [
          Image.file(File(widget.image.path)),
          ElevatedButton(
            onPressed: () {
              predict(File(widget.image.path));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("Predict"), predicted != null ? Text(predicted!) : Text("click")],
            ),
          ),
        ],
      ),
    );
  }
}
