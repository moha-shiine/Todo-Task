import 'package:get/get.dart';

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
