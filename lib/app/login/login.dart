import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordValidationController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Tasktugas',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Welcome to Tasktugas\nSign up or login below to manage your\nproject, task, and productivity',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
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
                          // Make the content scrollable
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              CustomInputField(
                                  hint: 'Enter your email',
                                  icon: Icons.email_outlined),
                              CustomInputField(
                                  hint: 'Enter your password',
                                  icon: Icons.lock_outline),
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
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                onPressed: () {},
                                child: const Text('Login',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Expanded(
                                      child: Divider(
                                          color: Colors.black45, thickness: 1)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text('or with continue with email',
                                        style: GoogleFonts.poppins()),
                                  ),
                                  const Expanded(
                                      child: Divider(
                                          color: Colors.black45, thickness: 1)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              SocialLoginButton(
                                  icon: Icons.apple,
                                  text: 'Login with Apple',
                                  color: Colors.black),
                              const SizedBox(height: 10),
                              SocialLoginButton(
                                  icon: Icons.g_translate,
                                  text: 'Login with Google',
                                  color: Colors.red),
                            ],
                          ),
                        ),

                        // Sign Up Tab
                        SingleChildScrollView(
                          // Make the content scrollable
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              CustomInputField(
                                  hint: 'Your name',
                                  icon: Icons.person_outline),
                              CustomInputField(
                                  hint: 'Enter your email',
                                  icon: Icons.email_outlined),
                              CustomInputFields(
                                hint: 'Enter your password',
                                icon: Icons.lock_outline,
                                onChanged: passwordController.updatePassword,
                              ),
                              CustomInputFields(
                                hint: 'Confirm your password',
                                icon: Icons.lock_outline,
                                onChanged:
                                    passwordController.updateConfirmPassword,
                              ),
                              //  const SizedBox(height: 10),

                              // Real-time Validation Feedback
                              Obx(
                                () => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          shape: const CircleBorder(),
                                          value:
                                              passwordController.hasMinLength,
                                          onChanged:
                                              null, // Disabled as it's for display only
                                          activeColor: Colors.green,
                                        ),
                                        Text(
                                          'At least 8 characters',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color:
                                                passwordController.hasMinLength
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          shape: const CircleBorder(),
                                          value: passwordController.hasNumber,
                                          onChanged: null,
                                          activeColor: Colors.green,
                                        ),
                                        Text(
                                          'At least 1 number',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: passwordController.hasNumber
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          shape: const CircleBorder(),
                                          value: passwordController
                                              .hasUpperAndLower,
                                          onChanged: null,
                                          activeColor: Colors.green,
                                        ),
                                        Text(
                                          'Both upper and lower case letters',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: passwordController
                                                    .hasUpperAndLower
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          shape: const CircleBorder(),
                                          value:
                                              passwordController.passwordsMatch,
                                          onChanged: null,
                                          activeColor: Colors.green,
                                        ),
                                        Text(
                                          'Passwords match',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: passwordController
                                                    .passwordsMatch
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                onPressed: () {
                                  if (passwordController.passwordsMatch &&
                                      passwordController.hasMinLength &&
                                      passwordController.hasNumber &&
                                      passwordController.hasUpperAndLower) {
                                    // Perform sign-up logic
                                    Get.snackbar('Success', 'Sign Up Complete!',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white);
                                  } else {
                                    Get.snackbar(
                                        'Error', 'Check your password!',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white);
                                  }
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                            //    ),
                            //   ],
                            // ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        minimumSize: const Size(double.infinity, 50),
      ),
      icon: Icon(icon, color: color),
      onPressed: () {},
      label: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  final String hint;
  final IconData icon;

  const CustomInputField({
    super.key,
    required this.hint,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black26),
          ),
        ),
      ),
    );
  }
}

class CustomInputFields extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function(String) onChanged;

  const CustomInputFields({
    super.key,
    required this.hint,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        onChanged: onChanged, // Updates the controller variable
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.black54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black26),
          ),
        ),
      ),
    );
  }
}

class PasswordValidationController extends GetxController {
  var password = ''.obs;
  var confirmPassword = ''.obs;

  // Validation checks
  bool get hasMinLength => password.value.length >= 8;
  bool get hasNumber => password.value.contains(RegExp(r'[0-9]'));
  bool get hasUpperAndLower =>
      password.value.contains(RegExp(r'[A-Z]')) &&
      password.value.contains(RegExp(r'[a-z]'));

  bool get passwordsMatch => password.value == confirmPassword.value;

  // Update password
  void updatePassword(String value) => password.value = value;
  void updateConfirmPassword(String value) => confirmPassword.value = value;
}
