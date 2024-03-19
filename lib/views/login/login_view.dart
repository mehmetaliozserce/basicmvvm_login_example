import 'package:flutter/material.dart';
import 'package:basicmvvmlogin/customs/customscaffold.dart';
import '../../viewmodels/login_view_model.dart';
import 'components/password_field.dart';
import 'components/username_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel viewModel = LoginViewModel();
  final GlobalKey<FormState> _usernameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordFormKey = GlobalKey<FormState>();
  bool _showUsernameField = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: _showUsernameField
                ? UsernameField(
                    key: UniqueKey(),
                    viewModel: viewModel,
                    usernameFormKey: _usernameFormKey,
                    onNext: _handleNext,
                  )
                : Container(),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: !_showUsernameField
                ? PasswordField(
                    key: UniqueKey(),
                    viewModel: viewModel,
                    passwordFormKey: _passwordFormKey,
                    onBack: _handleBack,
                    onLogin: _handleLogin,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  void _handleNext() {
    if (_usernameFormKey.currentState!.validate()) {
      setState(() {
        _showUsernameField = false;
      });
    }
  }

  void _handleBack() {
    setState(() {
      _showUsernameField = true;
    });
  }

  void _handleLogin() async {
    if (_passwordFormKey.currentState!.validate()) {
      bool success = await viewModel.login(
        viewModel.usernameController.text.trim(),
        viewModel.passwordController.text.trim(),
      );
      if (success) {
        // Başarılı ise ilgili sayfaya yönlendirme
      } else {
        // Hata döndür
      }
    }
  }
}
