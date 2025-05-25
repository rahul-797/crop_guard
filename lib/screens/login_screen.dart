import 'package:crop_guard/utils/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () =>
              loginController.isLoading.value
                  ? const Center(child: CircularProgressIndicator(color: Colors.green))
                  : _getContent(),
        ),
      ),
    );
  }

  _getContent() {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/icon.png", width: 164),
              SizedBox(height: 24),
              Text("Welcome to CropGuard", style: TextStyle(fontSize: 24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("About this app", style: TextStyle(fontSize: 16)),
                  GestureDetector(
                    onTap: () => Get.to(() => AboutScreen()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 14,
                        child: Icon(
                          Icons.navigate_next,
                          size: 28,
                          color: Color.fromARGB(255, 0, 150, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.all(32), child: _getLoginButtons()),
      ],
    );
  }

  _getLoginButtons() {
    return Column(
      children: [
        Text("Sign in for better experience"),
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            loginController.login();
          },
          icon: Image.asset('assets/google.png', height: 28, width: 28),
          label: Text('Sign in with Google', style: TextStyle(color: Colors.black87, fontSize: 18)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
            elevation: 2,
            side: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ],
    );
  }
}
