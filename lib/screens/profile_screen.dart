import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/utils/cache.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/login_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final loginController = Get.find<LoginController>();
  final ImagePicker _picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {
              showLogoutConfirmDialog();
            },
            icon: Icon(Icons.logout, size: 28),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
            builder: (query, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.green));
              }
              String url = "";
              if (snapshot.data != null &&
                  snapshot.data!.data() != null &&
                  snapshot.data!.data()!.containsKey('photoURL')) {
                url = snapshot.data!.data()!['photoURL'];
              }
              return Column(
                children: [
                  isLoading
                      ? SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator(color: Colors.green)),
                      )
                      : url == ""
                      ? SizedBox(height: 200, child: Image.asset("assets/profile.png", width: 100))
                      : SizedBox(
                        height: 200,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: CachedNetworkImageProvider(url),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _pickAndUploadImage();
                    },
                    child: Text("Change profile pic"),
                  ),
                  SizedBox(height: 20),
                  Visibility(
                    visible: url != "",
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _deleteImage();
                      },
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text("Delete Profile Pic"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // red background
                        foregroundColor: Colors.white, // white text
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _pickAndUploadImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (pickedFile == null) return;
    final File file = File(pickedFile.path);

    setState(() {
      isLoading = true;
    });
    final ref = FirebaseStorage.instance.ref().child('users').child(user!.uid).child('profile.jpg');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    cacheLocalFileAsNetworkImage(file, url);

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'photoURL': url,
    }, SetOptions(merge: true));
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _deleteImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child(user!.uid)
          .child('profile.jpg');
      await ref.delete();
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
        'photoURL': FieldValue.delete(),
      });
    } on FirebaseException catch (e) {
      print('Error deleting profile image: ${e.message}');
    }
    setState(() {
      isLoading = false;
    });
  }

  showLogoutConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Your data is safe.\nLogout from this account?'),
          actions: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(width: 2),
            GestureDetector(
              onTap: () {
                if (FirebaseAuth.instance.currentUser!.isAnonymous) {
                  loginController.anonymousLogout();
                } else {
                  loginController.logout();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Logout",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
