// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, prefer_const_declarations, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mind_origin/views/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _login() async {
    final String apiUrl = 'https://reqres.in/api/register';

    final String email = emailController.text;
    final String password = passwordController.text;

    print('Email: $email');
    print('Password: $password');

    if (email.isEmpty || password.isEmpty) {
      _showErrorToast("Email and password are required");
      return;
    }

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String token = data['token'];
      print('Login successful! Token: $token');
      _showSuccessToast();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      emailController.clear();
      passwordController.clear();
    } else {
      _showUnSuccessToast();
      print('Response : ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF0575E6),
                        Color(0xFF02298A),
                        Color(0xFF021B79),
                      ],
                    ),
                  ),
                  width: constraints.maxWidth / 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "GoFinance!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "The most popular peer to peer lending at SEA",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 150.0,
                          child: ElevatedButton(
                            onPressed: () {
                              print("read more");
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF0575E6),
                                shadowColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0))),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Read more",
                                style: TextStyle(fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: constraints.maxWidth / 2,
                  color: Colors.white,
                  child: Center(
                    child: _buildLoginForm(),
                  ),
                ),
              ],
            );
          } else {
            return _buildLoginForm();
          }
        },
      ),
    );
  }

  void _showSuccessToast() {
    Fluttertoast.showToast(
      msg: 'Login successful',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showUnSuccessToast() {
    Fluttertoast.showToast(
      msg: 'Login Unsuccessful',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Widget _buildLoginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ... Existing login form widgets
        Padding(
          padding: const EdgeInsetsDirectional.all(10.0),
          child: Text(
            "Hello Again!!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Welcome Back",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 300.0,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email Address',
                hintText: 'Enter Your Email Id',
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            width: 300.0,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter the Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          width: 300.0,
          child: ElevatedButton(
            onPressed: () {
              print("clicked");
              _login();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0575E6),
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Text("Forgot Password"),
          ),
        )
      ],
    );
  }
}
