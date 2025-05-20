import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  final XFile image;
  const PredictionScreen({super.key, required this.image});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Viewer")),
      body: Center(child: Image.file(File(widget.image.path))),
    );
  }
}
