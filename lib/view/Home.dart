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
      // backgroundColor: Colorthem.SecondryColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220),
        child: HeaderWidget(),
      ),
      body: Column(children: []),
    );
  }
}
