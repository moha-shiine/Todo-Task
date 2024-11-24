import 'package:flutter/material.dart';
import 'package:taskapp/color/them.dart';

class TextFeildWidget extends StatelessWidget {
  const TextFeildWidget(
      {super.key,
      required this.hinText,
      this.preficicon,
      this.onTap,
      required this.controller,
      this.maxLength,
      this.maxLine});
  final String hinText;
  final IconData? preficicon;
  final VoidCallback? onTap;
  final TextEditingController controller;
  final int? maxLength;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: maxLine,
        maxLength: maxLength,
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
            fillColor: Colors.grey.shade300,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
            suffixIcon: Icon(
              preficicon,
              color: Colorthem.SecondryColor,
            )),
        onTap: onTap);
  }
}
