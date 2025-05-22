import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  final XFile image;
  final String predictedVal;
  const PredictionScreen({super.key, required this.image, required this.predictedVal});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (context, result) {},
      child: Scaffold(
        appBar: AppBar(title: Text("Image Viewer")),
        body: Column(
          children: [
            Image.file(File(widget.image.path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text(widget.predictedVal)],
            ),
          ],
        ),
      ),
    );
  }
}
