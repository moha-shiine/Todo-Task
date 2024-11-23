import 'package:flutter/material.dart';

import '../view/model/category_model.dart';

class category extends StatefulWidget {
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  // Initialize the task list
  List<categoryMoldel> taskList = [
    categoryMoldel(icon: Icons.filter_alt, label: "All task"),
    categoryMoldel(icon: Icons.done, label: "Completed"),
    categoryMoldel(icon: Icons.pending, label: "Pending"),
    categoryMoldel(icon: Icons.cancel, label: "Cancelled"),
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
    return Column(
      children:
          taskList.asMap().entries.map((entry) {
            int index = entry.key;
            categoryMoldel task = entry.value;
            return GestureDetector(
              onTap: () => toggleSelection(index), // Toggle selection on tap
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: task.isSelected ? Colors.white : Colors.green,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                      ), // Optional border
                    ),
                    child: Icon(
                      task.icon,
                      color: task.isSelected ? Colors.green : Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    task.label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: task.isSelected ? Colors.green : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
