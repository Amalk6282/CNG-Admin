import 'package:cng_admin/features/home_screen.dart';
import 'package:cng_admin/features/login/login_page.dart';
import 'package:cng_admin/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Login',
      theme: appTheme,
      home: LoginPage(),
    );
  }
}
