import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:taskapp/app/addData.dart';
import 'package:taskapp/color/them.dart';
import 'package:taskapp/common/headerwidget.dart';

import '../controller/taskcontroller.dart';
import '../widget/dataCalender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateTime currentDate = DateTime.now();
  final TasksController tasksController = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colorthem.SecondryColor,
      body: Column(children: [
        Expanded(flex: 1, child: HeaderWidget()),
        Expanded(
            flex: 2,
            child: Obx(() {
              return Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorthem.thirtColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(10),
                          Card(
                            elevation: 4,
                            //semanticContainer: false,
                            color: Colorthem.thirtColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Gap(10),
                                Text(
                                  DateFormat(' MMMM d').format(currentDate),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colorthem.SecondryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    DateFormat('yyyy').format(currentDate),
                                    style: const TextStyle(
                                      color: Colorthem.PrimaryColor,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Gap(20),
                                dataCalenderWidget(),
                                Gap(10),
                              ],
                            ),
                          ),
                          // Gap(10),
                          ListView.builder(
                              reverse: true,
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemCount: tasksController.tasks.length,
                              itemBuilder: (context, index) {
                                final task = tasksController.tasks[index];
                                print(task);
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  // padding: EdgeInsets.symmetric(vertical: 6),
                                  height: 145,
                                  // height: MediaQuery.of(context).size.height * 0.2,
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(26),
                                    border: Border.all(
                                        color: Colorthem.SecondryColor,
                                        width: 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Gap(10),
                                      ListTile(
                                        title: Text(
                                          task.title,
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        minTileHeight: 10,
                                        isThreeLine: true,
                                        trailing: Text(
                                          task.timeTask.toString(),
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          task.subtitle,
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
                                                  color:
                                                      Colorthem.SecondryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: Text(
                                                "Compelet",
                                                style: TextStyle(
                                                    color: Colorthem.thirtColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            IconlyLight.editSquare,
                                            color: Colorthem.PrimaryColor,
                                          ),
                                          Gap(10),
                                          InkWell(
                                            onTap: () => tasksController
                                                .deleteTask(task.id!),
                                            child: Icon(
                                              IconlyLight.delete,
                                              color: Colorthem.SecondryColor,
                                            ),
                                          ),
                                          Gap(10)
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ));
            }))
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DateTimePickerWithStartEndTime()));
        },
        child: Container(
          height: 77,
          width: 77,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 8,
                  color: const Color.fromARGB(255, 201, 176, 255)
                      .withOpacity(0.2)),
              color: Colorthem.SecondryColor,
              borderRadius: BorderRadius.circular(100)),
          child: Icon(
            Icons.add,
            color: Colorthem.thirtColor,
            size: 33,
          ),
        ),
      ),
    );
  }
}
