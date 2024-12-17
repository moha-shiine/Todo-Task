import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Enter Verification  Code",
            style: GoogleFonts.aBeeZee(
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          Text("We have sent code to shiine12@gmail.com")
        ],
      ),
    );
  }
}
