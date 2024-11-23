import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';

import '../color/them.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colorthem.SecondryColor,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(12),
        //   bottomRight: Radius.circular(12),
        // ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(50),
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colorthem.thirtColor,
                  child: Image.asset(
                    "assets/avatar.png",
                    scale: 2.7,
                    fit: BoxFit.cover,
                  ),
                ),
                Gap(17),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colorthem.PrimaryColor,
                      ),
                    ),
                    Text(
                      "Mo shiine",
                      style: TextStyle(
                        color: Colorthem.thirtColor,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colorthem.thirtColor.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    IconlyLight.search,
                    size: 20,
                    color: Colorthem.thirtColor,
                  ),
                ),
                Gap(10),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colorthem.thirtColor.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Badge.count(
                    count: 1,
                    smallSize: 12,
                    backgroundColor: Colorthem.PrimaryColor,
                    child: Icon(
                      IconlyBold.notification,
                      size: 23,
                      color: Colorthem.thirtColor,
                    ),
                  ),
                ),
              ],
            ),

            Gap(20),

            // for(i=0, i++)
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colorthem.thirtColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(IconlyLight.filter),
            ),
          ],
        ),
      ),
    );
  }
}
