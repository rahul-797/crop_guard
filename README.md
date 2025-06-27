# 🌿 Growmie – Plant Disease Detector

Growmie is a mobile application that detects plant diseases from leaf images using an on-device TensorFlow Lite CNN model.
Grab the latest version from [Google Play](https://play.google.com/store/apps/details?id=com.cropguardapp.crop_guard).

---

## 📱 Features

- 🔍 **Plant Leaf Disease Detection**
  - Take a photo or upload from gallery.
  - CNN model classifies visible symptoms on the leaf.
- 🧠 **On-Device Inference**
  - Uses TensorFlow Lite — no internet required after install.
- 🛡️ **Privacy First**
  - All processing happens securely on the device.
- 🚀 **Lightweight**
  - Designed for low-resource Android devices.

---

## 🧪 Model Info

- **Dataset Used**: Plant Village [Plant Village Dataset](https://github.com/spMohanty/PlantVillage-Dataset).
- **Framework**: TensorFlow Lite (TFLite)
- **Model Type**: MobileNetV2
- **Input**: RGB image of a leaf (from camera or gallery)
- **Output**: Predicted disease label (e.g., "Powdery Mildew", "Leaf Rust", etc.)
- **Disease Classification**: It detects 38 plant diseases

---
