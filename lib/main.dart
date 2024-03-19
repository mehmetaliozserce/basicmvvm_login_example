import 'package:flutter/material.dart';

import 'package:basicmvvmlogin/views/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Example',
        theme: ThemeData(
            fontFamily: "Roboto",
            primaryColor: Color.fromRGBO(103, 198, 227, 1)),
        home: const LoginView());
  }
}
