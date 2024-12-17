import 'package:flutter/material.dart';

class CustomInputFields extends StatelessWidget {
  final String hint;
  final void Function()? onSaved;
  final IconData icon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomInputFields({
    super.key,
    required this.hint,
    this.obscureText = false,
    required this.icon,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.controller,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        //onSaved: onSaved,
        obscureText: obscureText, validator: validator,
        controller: controller,
        onChanged: onChanged, // Updates the controller variable
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.black54),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
