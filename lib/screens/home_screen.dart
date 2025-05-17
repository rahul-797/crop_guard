import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_service.dart';

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
  final LoginService loginService = LoginService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome ${FirebaseAuth.instance.currentUser!.displayName!.split(" ").first}"),
        actions: [
          IconButton(
            onPressed: () {
              showLogoutConfirmDialog();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
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
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.camera_alt),
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
