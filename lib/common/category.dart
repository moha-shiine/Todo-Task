import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:taskapp/color/them.dart';

import '../view/Home.dart';
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
        taskList[i].isSelected = i == index;
      }
    });
  }

  int selelctindex = 0;
  void handleItemTap(int index) {
    setState(() {
      selelctindex = index;
      _showBottomSheet(index);
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
                  index: 0,
                  onTap: handleItemTap,
                  isSelected: selelctindex == 0,
                ),
                HeadWidget(
                    icon: IconlyLight.plus,
                    title: "Cmpelete",
                    index: 1,
                    onTap: handleItemTap,
                    isSelected: selelctindex == 1),
                HeadWidget(
                    icon: Icons.done,
                    title: "Work",
                    index: 2,
                    onTap: handleItemTap,
                    isSelected: selelctindex == 2),
              ],
            ),
          ),
        ]));
  }

  void _showBottomSheet(int index) {
    if (index == 0) {
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                primary: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 10),
                          height: 20,
                          alignment: Alignment.center,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Colorthem.SecondryColor.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                IconlyLight.arrowLeft,
                                size: 12,
                              )),
                        ),
                        Gap(4),
                        Text(
                          'All Tasks',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            // padding: EdgeInsets.symmetric(vertical: 6),
                            height: 145,
                            // height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(
                                  color: Colorthem.SecondryColor, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(10),
                                ListTile(
                                  title: Text(
                                    "Task Appliction",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  minTileHeight: 10,
                                  isThreeLine: true,
                                  trailing: Text(
                                    "2024/11/02",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "waxaan samay nayaa app task anigoo isticmalaya flutter and dart",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 17),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: Colorthem.SecondryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          "Compelet",
                                          style: TextStyle(
                                              color: Colorthem.thirtColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        )),
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      IconlyLight.editSquare,
                                      color: Colorthem.PrimaryColor,
                                    ),
                                    Gap(10),
                                    Icon(
                                      IconlyLight.delete,
                                      color: Colorthem.SecondryColor,
                                    ),
                                    Gap(10)
                                  ],
                                )
                              ],
                              //       ),
                              //     );
                              //   ],
                              // ),
                            ),
                            // height: 222,
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
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
                    ? Colorthem.thirtColor
                    : Colorthem
                        .PrimaryColor, // Red for selected, white for unselected
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black),
              ),
              child: Icon(
                icon,
                size: 30,
                color: isSelected
                    ? Colorthem.PrimaryColor
                    : Colorthem
                        .thirtColor, // White icon for selected, black for unselected
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
