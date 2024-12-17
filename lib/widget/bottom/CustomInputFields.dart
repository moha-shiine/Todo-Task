import 'package:flutter/material.dart';

class CustomInputFields extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function(String)? onChanged;

  const CustomInputFields({
    super.key,
    required this.hint,
    required this.icon,
    this.onChanged,
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
