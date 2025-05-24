import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/utils/cache.dart';
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
  String photoURL = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    photoURL = box.read("photoURL");
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              photoURL != ""
                  ? isLoading
                      ? Center(child: CircularProgressIndicator())
                      : CircleAvatar(
                        radius: 80,
                        backgroundImage: CachedNetworkImageProvider(photoURL),
                        backgroundColor: Colors.grey[200],
                      )
                  : Image.asset("assets/profile.png", height: 100),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _pickAndUploadImage();
                },
                child: Text("Change profile pic"),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickAndUploadImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    setState(() {
      box.write("photoURL", "asdf");
      isLoading = true;
    });
    final File file = File(pickedFile.path);

    final ref = FirebaseStorage.instance.ref().child('users').child(user!.uid).child('profile.jpg');
    await ref.putFile(file);
    final url = await ref.getDownloadURL();
    cacheLocalFileAsNetworkImage(file, url);

    box.write("photoURL", url);
    setState(() {
      isLoading = false;
      photoURL = url;
    });

    await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
      'photoURL': url,
    }, SetOptions(merge: true));
  }

  Future<void> _deleteImage() async {
    try {
      box.write("photoURL", "");
      setState(() {
        photoURL = "";
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
