import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  LoginViewModel() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  Future<bool> login(String username, String password) async {
    // Burada login işlemlerini gerçekleştirin
    // Örneğin, bir API'ye istek gönderip kullanıcıyı doğrulayın
    return true;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
