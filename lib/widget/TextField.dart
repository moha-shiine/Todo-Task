import 'package:flutter/material.dart';

class TextFeildWidget extends StatelessWidget {
  const TextFeildWidget(
      {super.key,
      required this.hinText,
      this.preficicon,
      this.onTap,
      required this.controller});
  final String hinText;
  final IconData? preficicon;
  final VoidCallback? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
            hintText: hinText,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
            enabled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
            fillColor: Colors.grey.shade400,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(preficicon)),
        onTap: onTap);
  }
}
