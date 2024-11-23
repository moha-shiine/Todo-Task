import 'package:flutter/material.dart';

import '../color/them.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colorthem.SecondryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),

      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(children: [
        
      ],),
    );
  }
}
