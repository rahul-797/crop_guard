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
      appBar: AppBar(title: const Text("Crop Guard", style: TextStyle(fontSize: 24))),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 24.0),
        const SizedBox(height: 8.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 128),
            Padding(padding: const EdgeInsets.all(16), child: _getLoginButtons()),
          ],
        ),
      ],
    );
  }

  _getLoginButtons() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
        padding: const EdgeInsets.all(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 12),
          const SizedBox(width: 12),
          const Text('Sign in with Google', style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
      onPressed: () {
        loginService.login();
        isLoading = true;
        setState(() {});
      },
    );
  }
}
