import 'package:crop_guard/utils/login_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService loginService = LoginService.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator(color: Colors.white))
                : _getContent(),
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
            loginService.login();
            isLoading = true;
            setState(() {});
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
