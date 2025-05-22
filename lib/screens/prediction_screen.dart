import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PredictionScreen extends StatefulWidget {
  final XFile image;
  final int predictedIndex;
  final String predictedText;
  const PredictionScreen({
    super.key,
    required this.image,
    required this.predictedIndex,
    required this.predictedText,
  });

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  /*
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (context, result) {},
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Image.file(
                File(widget.image.path),
                width: Get.width,
                height: Get.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text(widget.predictedVal)],
            ),
          ],
        ),
      ),
    );
  }
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            collapsedHeight: kToolbarHeight,
            centerTitle: true,
            leading: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: FlexibleSpaceBar(
                background: Image.file(File(widget.image.path), fit: BoxFit.cover),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.predictedText, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '🧪 Treatment',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Biological:\nIf the soil is really dry, you may immerse the whole pot in water until it is evenly moist.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '🛡️ Prevention Strategies',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Biological:\nIf the soil is really dry, you may immerse the whole pot in water until it is evenly moist.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
