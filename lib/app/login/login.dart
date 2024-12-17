import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/controller/PasswordValidationController.dart';
import 'package:taskapp/widget/bottom/CustomInputFields.dart';
import 'package:taskapp/widget/bottom/socilaloginbotoom.dart';

import 'singup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false; // Track password visibility

  final passwordController = Get.put(PasswordValidationController());
  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible; // Toggle password visibility
    });
  }

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  void validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    "assets/log.png",
                    scale: 0.8,
                  ),
                ),
                Gap(20),
                Center(
                  child: Text(
                    'Welcome to Tasktugas ',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    'Sign up or login below to manage your\nproject, task, and productivity',
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                // Tabs for Login and Sign Up
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        indicatorColor: Colors.green,
                        labelColor: Colors.green,
                        unselectedLabelColor: Colors.black45,
                        tabs: [
                          Tab(text: 'Login'),
                          Tab(text: 'Sign Up'),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.7, // Adjust height dynamically
                        child: TabBarView(children: [
                          // Login Tab
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                SocialLoginButton(
                                    icon: Icons.apple,
                                    text: 'Login with Apple',
                                    color: Colors.black),
                                const SizedBox(height: 10),
                                SocialLoginButton(
                                    icon: Icons.g_translate,
                                    text: 'Login with Google',
                                    color: Colors.red),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Divider(
                                            color: Colors.black45,
                                            thickness: 1)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text('or with continue with email',
                                          style: GoogleFonts.poppins()),
                                    ),
                                    const Expanded(
                                        child: Divider(
                                            color: Colors.black45,
                                            thickness: 1)),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomInputFields(
                                  validator: (value) => value!.isEmpty
                                      ? 'Email cannot be blank'
                                      : null,
                                  controller: TextEditingController(),
                                  hint: 'Enter your email',
                                  icon: Icons.email_outlined,
                                ),
                                CustomInputFields(
                                  validator: (value) => value!.isEmpty
                                      ? 'Password cannot be blank'
                                      : null,
                                  obscureText:
                                      !_isPasswordVisible, // Use the visibility state
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed:
                                        _togglePasswordVisibility, // Toggle visibility
                                  ),
                                  hint: 'Enter your password',
                                  icon: Icons.lock_outline,
                                ),
                                const SizedBox(height: 10),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forgot Password?',
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                  ),
                                  onPressed: () {
                                    validateAndSave();
                                  },
                                  child: const Text('Login',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                          // Sign Up Tab
                          SinupWiget(passwordController: passwordController),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
