import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/app/login/singup.dart';
import 'package:taskapp/widget/bottom/CustomInputFields.dart';
import 'package:taskapp/widget/bottom/socilaloginbotoom.dart';

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
                              CustomInputFields(
                                  hint: 'Enter your email',
                                  icon: Icons.email_outlined),
                              CustomInputFields(
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
    );
  }
}

// class CustomInputField extends StatelessWidget {
//   final String hint;
//   final IconData icon;

//   const CustomInputField({
//     super.key,
//     required this.hint,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: hint,
//           prefixIcon: Icon(icon, color: Colors.black54),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: Colors.black26),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
