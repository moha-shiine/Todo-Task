import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/color/them.dart';
import 'package:taskapp/controller/taskcontroller.dart';
import 'package:taskapp/view/Home.dart';
import 'package:taskapp/widget/TextField.dart';
import 'package:taskapp/widget/dataCalender.dart';

class DateTimePickerWithStartEndTime extends StatefulWidget {
  @override
  _DateTimePickerWithStartEndTimeState createState() =>
      _DateTimePickerWithStartEndTimeState();
}

class _DateTimePickerWithStartEndTimeState
    extends State<DateTimePickerWithStartEndTime> {
  final TasksController tasksController = Get.find();
  TextEditingController categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  Future<void> _pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  Future<void> _pickTime(
      BuildContext context, TextEditingController timeController) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      DateTime fullTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      setState(() {
        timeController.text = DateFormat('hh:mm a').format(fullTime);
      });
    }
  }

  final DateTime currentDate = DateTime.now();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50),
              Container(
                margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
                height: 30,
                alignment: Alignment.center,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colorthem.SecondryColor.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: Icon(
                    IconlyLight.arrowLeft,
                    size: 18,
                  ),
                ),
              ),
              Gap(20),
              Text(
                DateFormat(' MMMM d, yyyy').format(currentDate),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colorthem.SecondryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('EEEE').format(currentDate),
                style: const TextStyle(
                  color: Colorthem.PrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dataCalenderWidget(),
              Gap(20),
              Container(
                color: Colors.grey.withOpacity(0.1),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "Create New Task",
                      style: TextStyle(
                        color: Colorthem.SecondryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(20),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: "Title"),
                    ),
                    Gap(16),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(hintText: "Subtitle"),
                    ),
                    Gap(16),
                    TextField(
                      controller: categoryController,
                      decoration: InputDecoration(hintText: "Category"),
                    ),
                    Gap(16),
                    TextFeildWidget(
                      hinText: 'Pick Start Time',
                      onTap: () => _pickTime(context, _startTimeController),
                      controller: _startTimeController,
                      preficicon: IconlyLight.timeSquare,
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Text(
                          "Reminder Time",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Spacer(),
                        Text(
                          isSwitched ? "ON" : "OFF",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ],
                    ),
                    Gap(20),
                    Container(
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                          color: Colorthem.SecondryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colorthem.SecondryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (_titleController.text.isNotEmpty) {
                            tasksController.insertTask({
                              'title': _titleController.text,
                              'category': categoryController.text,
                              'subtitle': _descriptionController.text,
                              'timeTask': _dateTimeController.text,
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          } else {
                            Get.snackbar(
                              'Error',
                              'Title is required',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(
                              color: Colorthem.thirtColor,
                              fontSize: 26,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateTimeController.dispose();
    _startTimeController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}
