import 'package:flutter/material.dart';
import 'package:basicmvvmlogin/customs/custombutton.dart';
import 'package:basicmvvmlogin/customs/customtextfield.dart';

import '../../../viewmodels/login_view_model.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    required this.viewModel,
    required this.usernameFormKey,
    required this.onNext,
  });

  final LoginViewModel viewModel;
  final GlobalKey<FormState> usernameFormKey;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: usernameFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: 'Username',
            controller: viewModel.usernameController,
            validator: viewModel.validateUsername,
          ),
          const SizedBox(height: 15),
          CustomButton(
            text: 'Next',
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
