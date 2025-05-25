import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final List<Map<String, String>> data = [
    {
      "Class": "Apple Scab",
      "Precision": "1.00",
      "Recall": "0.72",
      "F1-Score": "0.84",
      "Support": "100",
    },
    {
      "Class": "Apple Black Rot",
      "Precision": "0.93",
      "Recall": "0.99",
      "F1-Score": "0.96",
      "Support": "100",
    },
    {
      "Class": "Cedar Apple Rust",
      "Precision": "0.92",
      "Recall": "1.00",
      "F1-Score": "0.96",
      "Support": "100",
    },
    {
      "Class": "Healthy Apple",
      "Precision": "0.95",
      "Recall": "0.98",
      "F1-Score": "0.96",
      "Support": "165",
    },
    {
      "Class": "Background (No Leaves)",
      "Precision": "1.00",
      "Recall": "0.90",
      "F1-Score": "0.94",
      "Support": "115",
    },
    {
      "Class": "Healthy Blueberry",
      "Precision": "0.99",
      "Recall": "1.00",
      "F1-Score": "1.00",
      "Support": "151",
    },
    {
      "Class": "Cherry Powdery Mildew",
      "Precision": "1.00",
      "Recall": "0.97",
      "F1-Score": "0.99",
      "Support": "106",
    },
    {
      "Class": "Healthy Cherry",
      "Precision": "1.00",
      "Recall": "1.00",
      "F1-Score": "1.00",
      "Support": "100",
    },
    {
      "Class": "Corn Gray Leaf Spot",
      "Precision": "0.89",
      "Recall": "0.68",
      "F1-Score": "0.77",
      "Support": "100",
    },
    {
      "Class": "Corn Common Rust",
      "Precision": "0.94",
      "Recall": "1.00",
      "F1-Score": "0.97",
      "Support": "120",
    },
    {
      "Class": "Corn Northern Leaf Blight",
      "Precision": "0.71",
      "Recall": "0.95",
      "F1-Score": "0.82",
      "Support": "100",
    },
    {
      "Class": "Healthy Corn",
      "Precision": "1.00",
      "Recall": "0.97",
      "F1-Score": "0.98",
      "Support": "117",
    },
    {
      "Class": "Grape Black Rot",
      "Precision": "0.99",
      "Recall": "0.98",
      "F1-Score": "0.99",
      "Support": "118",
    },
    {
      "Class": "Grape Esca",
      "Precision": "0.99",
      "Recall": "0.99",
      "F1-Score": "0.99",
      "Support": "139",
    },
    {
      "Class": "Grape Leaf Blight",
      "Precision": "0.93",
      "Recall": "1.00",
      "F1-Score": "0.96",
      "Support": "109",
    },
    {
      "Class": "Healthy Grape",
      "Precision": "0.97",
      "Recall": "1.00",
      "F1-Score": "0.99",
      "Support": "100",
    },
    {
      "Class": "Orange Citrus Greening",
      "Precision": "1.00",
      "Recall": "0.98",
      "F1-Score": "0.99",
      "Support": "552",
    },
    {
      "Class": "Peach Bacterial Spot",
      "Precision": "0.93",
      "Recall": "1.00",
      "F1-Score": "0.96",
      "Support": "231",
    },
    {
      "Class": "Healthy Peach",
      "Precision": "0.99",
      "Recall": "0.95",
      "F1-Score": "0.97",
      "Support": "100",
    },
    {
      "Class": "Pepper Bell Bacterial Spot",
      "Precision": "0.96",
      "Recall": "0.98",
      "F1-Score": "0.97",
      "Support": "100",
    },
    {
      "Class": "Healthy Pepper Bell",
      "Precision": "0.95",
      "Recall": "1.00",
      "F1-Score": "0.97",
      "Support": "149",
    },
    {
      "Class": "Potato Early Blight",
      "Precision": "0.90",
      "Recall": "1.00",
      "F1-Score": "0.95",
      "Support": "100",
    },
    {
      "Class": "Potato Late Blight",
      "Precision": "0.82",
      "Recall": "0.99",
      "F1-Score": "0.90",
      "Support": "100",
    },
    {
      "Class": "Healthy Potato",
      "Precision": "0.92",
      "Recall": "0.96",
      "F1-Score": "0.94",
      "Support": "100",
    },
    {
      "Class": "Healthy Raspberry",
      "Precision": "1.00",
      "Recall": "1.00",
      "F1-Score": "1.00",
      "Support": "100",
    },
    {
      "Class": "Healthy Soybean",
      "Precision": "1.00",
      "Recall": "0.93",
      "F1-Score": "0.96",
      "Support": "509",
    },
    {
      "Class": "Squash Powdery Mildew",
      "Precision": "0.93",
      "Recall": "0.99",
      "F1-Score": "0.96",
      "Support": "184",
    },
    {
      "Class": "Strawberry Leaf Scorch",
      "Precision": "0.99",
      "Recall": "0.96",
      "F1-Score": "0.98",
      "Support": "112",
    },
    {
      "Class": "Healthy Strawberry",
      "Precision": "0.99",
      "Recall": "0.95",
      "F1-Score": "0.97",
      "Support": "100",
    },
    {
      "Class": "Tomato Bacterial Spot",
      "Precision": "0.81",
      "Recall": "0.98",
      "F1-Score": "0.89",
      "Support": "214",
    },
    {
      "Class": "Tomato Early Blight",
      "Precision": "0.88",
      "Recall": "0.67",
      "F1-Score": "0.76",
      "Support": "100",
    },
    {
      "Class": "Tomato Late Blight",
      "Precision": "0.97",
      "Recall": "0.85",
      "F1-Score": "0.91",
      "Support": "192",
    },
    {
      "Class": "Tomato Leaf Mold",
      "Precision": "0.94",
      "Recall": "0.85",
      "F1-Score": "0.89",
      "Support": "100",
    },
    {
      "Class": "Tomato Septoria Leaf Spot",
      "Precision": "0.90",
      "Recall": "0.84",
      "F1-Score": "0.87",
      "Support": "178",
    },
    {
      "Class": "Tomato Spider Mites",
      "Precision": "0.92",
      "Recall": "0.91",
      "F1-Score": "0.91",
      "Support": "169",
    },
    {
      "Class": "Tomato Target Spot",
      "Precision": "0.85",
      "Recall": "0.79",
      "F1-Score": "0.82",
      "Support": "141",
    },
    {
      "Class": "Tomato Yellow Leaf Curl Virus",
      "Precision": "1.00",
      "Recall": "0.93",
      "F1-Score": "0.96",
      "Support": "537",
    },
    {
      "Class": "Tomato Mosaic Virus",
      "Precision": "1.00",
      "Recall": "0.88",
      "F1-Score": "0.94",
      "Support": "100",
    },
    {
      "Class": "Healthy Tomato",
      "Precision": "0.71",
      "Recall": "0.99",
      "F1-Score": "0.83",
      "Support": "160",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About", style: TextStyle(fontWeight: FontWeight.bold))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Disclaimer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                "🔺 This app is a student/experimental project and not a substitute for professional agricultural advice. "
                "The predictions may not be accurate. Use at your own discretion.",
                style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Text(
                "Model Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Model: MobileNetV2\n"
                "• Dataset: PlantVillage\n"
                "• Trainable Parameters: ~0.8 Million\n"
                "• Non-trainable Parameters: ~2.2 Million\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "Performance metrics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "• Accuracy: 0.94\n"
                "• F1 Score: 0.94\n"
                "• Precision: 0.95\n"
                "• Recall: 0.94\n",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              Text(
                "Classification Report",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 8,
                  columns: const [
                    DataColumn(label: Text("Class", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                      label: Text("Precision", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Recall", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("F1-Score", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Support", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                  headingRowColor: MaterialStateProperty.all(Colors.green.shade50),
                  rows:
                      data
                          .map(
                            (item) => DataRow(
                              cells: [
                                DataCell(Text(item["Class"]!)),
                                DataCell(Text(item["Precision"]!)),
                                DataCell(Text(item["Recall"]!)),
                                DataCell(Text(item["F1-Score"]!)),
                                DataCell(Text(item["Support"]!)),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Made with "),
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                    Text(" by Rahul"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
