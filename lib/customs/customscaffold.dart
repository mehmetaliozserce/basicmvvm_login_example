import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final String? title;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: title != null ? Text(title!) : const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo.png"), opacity: 0.1)),
            child: body),
      ),
    );
  }
}
