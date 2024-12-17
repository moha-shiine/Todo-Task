import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckboxRow extends StatelessWidget {
  final bool value;
  final String text;

  const CustomCheckboxRow({
    super.key,
    required this.value,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0), // Adjust spacing here
      child: Transform.translate(
        offset: Offset(-0, -10),
        child: Row(
          children: [
            Transform.translate(
              offset: Offset(0, 0),
              child: Checkbox(
                shape: const CircleBorder(),
                value: value,
                onChanged: null, // Read-only
                activeColor: Colors.green,
              ),
            ),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: value ? Colors.green : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
