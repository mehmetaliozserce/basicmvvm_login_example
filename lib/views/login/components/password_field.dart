import 'package:flutter/material.dart';
import 'package:basicmvvmlogin/customs/custombutton.dart';
import 'package:basicmvvmlogin/customs/customtextfield.dart';

import '../../../viewmodels/login_view_model.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.viewModel,
    required this.passwordFormKey,
    required this.onBack,
    required this.onLogin,
  });

  final LoginViewModel viewModel;
  final GlobalKey<FormState> passwordFormKey;
  final VoidCallback onBack;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: passwordFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: 'Password',
            controller: viewModel.passwordController,
            obscureText: true,
            validator: viewModel.validatePassword,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                text: 'Back',
                onPressed: onBack,
              ),
              CustomButton(
                text: 'Login',
                onPressed: onLogin,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
