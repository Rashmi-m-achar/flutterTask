// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:mind_origin/views/login_page.dart';
import 'package:mind_origin/views/register_page.dart';
import 'package:mind_origin/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RegisterPage(),
      // home: LoginPage(),
      // home: HomeScreen(),
    );
  }
}
