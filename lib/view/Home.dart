import 'package:flutter/material.dart';
import 'package:taskapp/color/them.dart';
import 'package:taskapp/common/headerwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorthem.SecondryColor,
      body: Column(
        children: [
          Expanded(flex: 1, child: HeaderWidget()),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colorthem.thirtColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 222,
            ),
          ),
        ],
      ),
    );
  }
}
