import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:taskapp/controller/PasswordValidationController.dart';
import 'package:taskapp/widget/bottom/CustomInputFields.dart';

import 'package:taskapp/widget/checkbox.dart';

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
          const SizedBox(height: 10),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckboxRow(
                    value: passwordController.hasMinLength,
                    text: 'At least 8 characters'),
                Transform.translate(
                  offset: Offset(-0, -22),
                  child: CustomCheckboxRow(
                      value: passwordController.hasNumber,
                      text: 'At least 1 number'),
                ),
                Transform.translate(
                  offset: Offset(-0, -45),
                  child: CustomCheckboxRow(
                      value: passwordController.hasUpperAndLower,
                      text: 'Both upper and lower case letters'),
                ),
                Transform.translate(
                  offset: Offset(-0, -70),
                  child: CustomCheckboxRow(
                      value: passwordController.passwordsMatch,
                      text: 'Passwords match'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Transform.translate(
            offset: Offset(-0, -90),
            child: ElevatedButton(
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
          ),
        ],
      ),
    );
  }
}
