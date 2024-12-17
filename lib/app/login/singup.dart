import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'package:taskapp/controller/PasswordValidationController.dart';
import 'package:taskapp/widget/bottom/CustomInputFields.dart';

import 'package:taskapp/widget/checkbox.dart';

class SinupWiget extends StatefulWidget {
  const SinupWiget({
    super.key,
    required this.passwordController,
  });

  final PasswordValidationController passwordController;

  @override
  State<SinupWiget> createState() => _SinupWigetState();
}

bool _isPasswordVisible = false; // Track password visibility

class _SinupWigetState extends State<SinupWiget> {
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
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            CustomInputFields(
                validator: (value) => value!.isEmpty ? 'Enter username' : null,
                hint: 'Your name',
                icon: Icons.person_outline),
            CustomInputFields(
                validator: (value) =>
                    value!.isEmpty ? 'Email cannot be blank' : null,
                hint: 'Enter your email',
                icon: Icons.email_outlined),
            CustomInputFields(
              validator: (value) =>
                  value!.isEmpty ? 'Password cannot be blank' : null,
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              ),
              hint: 'Enter your password',
              icon: Icons.lock_outline,
              onChanged: widget.passwordController.updatePassword,
            ),
            CustomInputFields(
              validator: (value) =>
                  value!.isEmpty ? 'Confirm  password cannot be Match' : null,
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              ),
              hint: 'Confirm your password',
              icon: Icons.lock_outline,
              onChanged: widget.passwordController.updateConfirmPassword,
            ),
            const SizedBox(height: 10),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomCheckboxRow(
                      value: widget.passwordController.hasMinLength,
                      text: 'At least 8 characters'),
                  Transform.translate(
                    offset: Offset(-0, -22),
                    child: CustomCheckboxRow(
                        value: widget.passwordController.hasNumber,
                        text: 'At least 1 number'),
                  ),
                  Transform.translate(
                    offset: Offset(-0, -45),
                    child: CustomCheckboxRow(
                        value: widget.passwordController.hasUpperAndLower,
                        text: 'Both upper and lower case letters'),
                  ),
                  Transform.translate(
                    offset: Offset(-0, -70),
                    child: CustomCheckboxRow(
                        value: widget.passwordController.passwordsMatch,
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
                  validateAndSave();
                  if (widget.passwordController.passwordsMatch &&
                      widget.passwordController.hasMinLength &&
                      widget.passwordController.hasNumber &&
                      widget.passwordController.hasUpperAndLower) {
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
      ),
    );
  }
}
