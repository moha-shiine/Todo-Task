import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
      child: Row(
        children: taskList.asMap().entries.map((entry) {
          int index = entry.key;
          categoryMoldel task = entry.value;
          return GestureDetector(
            onTap: () => toggleSelection(index), // Toggle selection on tap
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: task.isSelected
                          ? Colors.white
                          : Colorthem.PrimaryColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black,
                      ), // Optional border
                    ),
                    child: Icon(
                      task.icon,
                      size: 30,
                      color: task.isSelected ? Colors.green : Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    task.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: task.isSelected ? Colors.green : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
