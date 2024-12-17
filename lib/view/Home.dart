// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/app/add.dart';
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
      body: Column(
        children: [
          Expanded(child: HeaderWidget()),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colorthem.thirtColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Obx(() {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        Card(
                          elevation: 4,
                          color: Colorthem.thirtColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(10),
                              Text(
                                DateFormat('MMMM d').format(currentDate),
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
                              const Gap(20),
                              dataCalenderWidget(),
                              const Gap(10),
                            ],
                          ),
                        ),
                        const Gap(10),
                        ListView.builder(
                          reverse: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: tasksController.tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasksController.tasks[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TaskEditPage(task: task)));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                height: 145,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  border: Border.all(
                                    color: Colorthem.SecondryColor,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Gap(10),
                                    ListTile(
                                      title: Text(
                                        task.title.toString(),
                                        style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      minVerticalPadding: 10,
                                      isThreeLine: true,
                                      trailing: Text(
                                        task.timeTask.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task.subtitle.toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Gap(2),
                                          Text(
                                            '${task.start_time}, ${task.end_time}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(10),
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
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Complete",
                                                style: TextStyle(
                                                  color: Colorthem.thirtColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TaskEditPage(
                                                            task: task)));
                                          },
                                          child: Icon(
                                            IconlyLight.editSquare,
                                            color: Colorthem.PrimaryColor,
                                          ),
                                        ),
                                        const Gap(10),
                                        InkWell(
                                          onTap: () => tasksController
                                              .deleteTask(task.id),
                                          child: Icon(
                                            IconlyLight.delete,
                                            color: Colorthem.SecondryColor,
                                          ),
                                        ),
                                        const Gap(10),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DateTimePickerWithStartEndTime(),
            ),
          );
        },
        child: Container(
          height: 77,
          width: 77,
          decoration: BoxDecoration(
            border: Border.all(
              width: 8,
              color: const Color.fromARGB(255, 201, 176, 255).withOpacity(0.2),
            ),
            color: Colorthem.SecondryColor,
            borderRadius: BorderRadius.circular(100),
          ),
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
