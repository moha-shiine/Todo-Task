import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:taskapp/controller/PasswordValidationController.dart';
import 'package:taskapp/widget/bottom/CustomInputFields.dart';

class SinupWiget extends StatelessWidget {
  const SinupWiget({
    super.key,
    required this.passwordController,
  });

  final PasswordValidationController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CustomInputFields(hint: 'Your name', icon: Icons.person_outline),
          CustomInputFields(
              hint: 'Enter your email', icon: Icons.email_outlined),
          CustomInputFields(
            hint: 'Enter your password',
            icon: Icons.lock_outline,
            onChanged: passwordController.updatePassword,
          ),
          CustomInputFields(
            hint: 'Confirm your password',
            icon: Icons.lock_outline,
            onChanged: passwordController.updateConfirmPassword,
          ),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Checkbox(
                      shape: const CircleBorder(),
                      value: passwordController.hasMinLength,
                      onChanged: null, // Disabled as it's for display only
                      activeColor: Colors.green,
                    ),
                    Text(
                      'At least 8 characters',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: passwordController.hasMinLength
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
                      value: passwordController.hasUpperAndLower,
                      onChanged: null,
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Both upper and lower case letters',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: passwordController.hasUpperAndLower
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
                      value: passwordController.passwordsMatch,
                      onChanged: null,
                      activeColor: Colors.green,
                    ),
                    Text(
                      'Passwords match',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: passwordController.passwordsMatch
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
                Get.snackbar('Error', 'Check your password!',
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
      ),
    );
  }
}
