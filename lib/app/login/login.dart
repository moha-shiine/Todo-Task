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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  "assets/log.png",
                  scale: 0.8,
                ),
              ),
              const Gap(20),
              Center(
                child: Text(
                  'Welcome to Tasktugas',
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
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
                ),
              ),
              Gap(20)
            ],
          ),
          toolbarHeight: 180,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: SingleChildScrollView(
            // padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // DefaultTabController wraps both TabBar and TabBarView
                  Container(
                    color: Colors.white,
                    child: const TabBar(
                      //  isScrollable: true,
                      indicatorColor: Colors.green,
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black45,
                      tabs: [
                        Tab(text: 'Login'),
                        Tab(text: 'Sign Up'),
                      ],
                    ),
                  ),
                  Gap(20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: TabBarView(
                        children: [
                          // Login Tab Content
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
                                    color: Colors.black),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const Expanded(
                                        child: Divider(
                                            color: Colors.black45,
                                            thickness: 1)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text('or continue with email',
                                          style: GoogleFonts.poppins()),
                                    ),
                                    const Expanded(
                                        child: Divider(
                                            color: Colors.black45,
                                            thickness: 1)),
                                  ],
                                ),
                                const SizedBox(height: 35),
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
                                  obscureText: !_isPasswordVisible,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: _togglePasswordVisibility,
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

                          // Sign-Up Tab Content
                          SinupWiget(passwordController: passwordController),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
