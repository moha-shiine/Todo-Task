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

  int selelctindex = 0;
  void handleItemTap(int index) {
    setState(() {
      selelctindex = index;
      _showBottomSheet(index);
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
                HeadWidget(
                  icon: IconlyLight.filter,
                  title: "All Task",
                  index: 1,
                  onTap: handleItemTap,
                  isSelected: selelctindex == 1,
                ),
                HeadWidget(
                    icon: IconlyLight.filter,
                    title: "Cmpelete",
                    index: 2,
                    onTap: handleItemTap,
                    isSelected: selelctindex == 2),
                HeadWidget(
                    icon: IconlyLight.filter,
                    title: "Cmpelete",
                    index: 3,
                    onTap: handleItemTap,
                    isSelected: selelctindex == 3),
              ],
            ),
          ),
        ]));
  }

  void _showBottomSheet(int index) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Selected Index: $index',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'You tapped on the item with index: $index',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the BottomSheet
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeadWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final int index;
  final bool isSelected;
  final ValueChanged<int> onTap;

  const HeadWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          onTap(index); // Pass the index to parent when tapped
        },
        child: Column(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.red
                    : Colors.white, // Red for selected, white for unselected
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Icon(
                icon,
                size: 30,
                color: isSelected
                    ? Colors.white
                    : Colors
                        .black, // White icon for selected, black for unselected
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
