import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:taskapp/color/them.dart';

import '../view/model/category_model.dart';

class category extends StatefulWidget {
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  // Initialize the task list
  List<categoryMoldel> taskList = [
    categoryMoldel(icon: IconlyLight.filter, label: "All task"),
    categoryMoldel(icon: Icons.done, label: "Work"),
    categoryMoldel(icon: IconlyLight.scan, label: "Idea"),
    categoryMoldel(icon: Icons.favorite_rounded, label: "Fovraite"),
    categoryMoldel(icon: IconlyLight.profile, label: "Personal"),
  ];

  // Function to handle selection
  void toggleSelection(int index) {
    setState(() {
      for (int i = 0; i < taskList.length; i++) {
        taskList[i].isSelected = i == index; // Only select the clicked item
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          // int index = entry.key;
          //  categoryMoldel task = entry.value;

          //   onTap: () => toggleSelection(index), // Toggle selection on tap
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Headwiget(
                  icon: IconlyLight.filter,
                  title: "All Task",
                  onTap: () {
                    print('Widget tapped!');
                  },
                ),
                Headwiget(
                  icon: IconlyLight.filter,
                  title: "All Task",
                  onTap: () {},
                ),
                // Column(
                //   children: [
                //     Container(
                //       height: 65,
                //       width: 65,
                //       decoration: BoxDecoration(
                //         color: task.isSelected
                //             ? Colors.white
                //             : Colorthem.PrimaryColor,
                //         borderRadius: BorderRadius.circular(16),
                //         border: Border.all(
                //           color: Colors.black,
                //         ), // Optional border
                //       ),
                //       child: Icon(
                //         task.icon,
                //         size: 30,
                //         color: task.isSelected ? Colors.green : Colors.white,
                //       ),
                //     ),
                //     SizedBox(height: 8),
                //     Text(
                //       task.label,
                //       style: TextStyle(
                //         fontSize: 14,
                //         fontWeight: FontWeight.bold,
                //         color: task.isSelected ? Colors.green : Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ]));
  }
}

class Headwiget extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  final IconData icon;
  const Headwiget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  State<Headwiget> createState() => _HeadwigetState();
}

class _HeadwigetState extends State<Headwiget> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected; // Toggle selection state
              });
              widget.onTap();
            },
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color:
                    // ignore: dead_code
                    isSelected ? Colorthem.thirtColor : Colorthem.PrimaryColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.black,
                ), // Optional border
              ),
              child: Icon(
                widget.icon,
                size: 30,
                color:
                    // ignore: dead_code
                    isSelected ? Colorthem.PrimaryColor : Colorthem.thirtColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
