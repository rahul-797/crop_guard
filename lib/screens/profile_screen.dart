import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/login_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LoginService loginService = LoginService.instance;
  final ImagePicker _picker = ImagePicker();
  final user = FirebaseAuth.instance.currentUser;
  GetStorage box = GetStorage();
  String? photoURL;

  @override
  void initState() {
    photoURL = box.read("photoURL");
    super.initState();
  }

  Future<void> _pickAndUploadImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final File file = File(pickedFile.path);
    final ref = FirebaseStorage.instance.ref().child('users').child(user!.uid).child('profile.jpg');

    await ref.putFile(file);
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'photoURL': url,
    }, SetOptions(merge: true));

    box.write("photoURL", url);
    photoURL = url;

    setState(() {
      photoURL = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showLogoutConfirmDialog();
              },
              child: Text("logout"),
            ),
            photoURL != null
                ? CachedNetworkImage(imageUrl: photoURL!)
                : Icon(Icons.person, size: 56),
            SizedBox(height: 20),
            Text("Tap to change profile picture", style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  showLogoutConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Logout from this account?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                loginService.logout();
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
              child: const Text('Yes', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(width: 6),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey.shade400)),
              child: const Text('No', style: TextStyle(color: Colors.black87)),
            ),
            const SizedBox(width: 2),
          ],
        );
      },
    );
  }
}
