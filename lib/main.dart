import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/core/initialize/app_theme.dart';
import 'package:fruit_app/features/view/welcome/welcome_view.dart';
import 'package:fruit_app/locator.dart';

void main(List<String> args) {
  getItSetup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(context).theme,
      home: const WelcomeView(),
    );
  }
}
