import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crop_guard/models/user/user_model.dart';
import 'package:crop_guard/screens/camera_screen.dart';
import 'package:crop_guard/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

BorderRadius splitBorder(int index) {
  return index == 0
      ? BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))
      : BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetStorage box = GetStorage();

  @override
  void initState() {
    _loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome ${FirebaseAuth.instance.currentUser!.displayName!.split(" ").first}"),
        actions: [
          IconButton(onPressed: () => Get.to(ProfileScreen()), icon: const Icon(Icons.person)),
        ],
      ),
      body: Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(CameraScreen()),
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  Future<void> _loadUserData() async {
    final doc =
        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
    AppUser user = AppUser.fromJson(doc.data()!);
    box.write("userId", user.userId);
    box.write("photoURL", user.photoURL);
    print(user);
  }
}

/**
StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance
                        .collection('habits')
                        .where('ownerId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final docs = snapshot.data?.docs ?? [];
                  if (docs.isEmpty) {
                    return const Center(child: Text('No habits found.'));
                  }
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final habit = docs[index].data() as Map<String, dynamic>;
                      return GestureDetector(
                        onTap: () => {},
                        child: ListTile(title: Text(habit['title'])),
                      );
                    },
                  );
                },
              ),
 **/
