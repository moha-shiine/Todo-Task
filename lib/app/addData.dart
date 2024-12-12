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
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool isSwitched = false;

  Future<void> _pickTime(
    BuildContext context,
    TextEditingController timeController, {
    required bool isStartTime,
  }) async {
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

        if (isStartTime) {
          _startTime = pickedTime;
        } else {
          _endTime = pickedTime;
        }
      });
    }
  }

  bool _isTimeValid() {
    if (_startTime == null || _endTime == null) return true;
    return _startTime!.hour < _endTime!.hour ||
        (_startTime!.hour == _endTime!.hour &&
            _startTime!.minute < _endTime!.minute);
  }

  void _validateAndCreateTask() {
    if (_titleController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Title is required',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    if (!_isTimeValid()) {
      Get.snackbar(
        'Error',
        'Start time must be earlier than end time',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final String currentDateFormatted =
        DateFormat('yyyy-MM-dd').format(DateTime.now());

    tasksController.insertTask({
      'title': _titleController.text,
      'category': categoryController.text,
      'subtitle': _descriptionController.text,
      'start_time': _startTimeController.text,
      'end_time': _endTimeController.text,
      'timeTask': currentDateFormatted,
    });

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

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
              const Gap(50),
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
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
                  child: const Icon(
                    IconlyLight.arrowLeft,
                    size: 18,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                DateFormat('MMMM d, yyyy').format(DateTime.now()),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colorthem.SecondryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat('EEEE').format(DateTime.now()),
                style: const TextStyle(
                  color: Colorthem.PrimaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dataCalenderWidget(),
              const Gap(20),
              Container(
                color: Colors.grey.withOpacity(0.1),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Create New Task",
                      style: TextStyle(
                        color: Colorthem.SecondryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(20),
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(hintText: "Title"),
                    ),
                    const Gap(16),
                    TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(hintText: "Subtitle"),
                    ),
                    const Gap(16),
                    TextField(
                      controller: categoryController,
                      decoration: const InputDecoration(hintText: "Category"),
                    ),
                    const Gap(16),
                    // TextFeildWidget(
                    //   hinText: 'Pick Start Time',
                    //   onTap: () => _pickTime(context, _startTimeController,
                    //       isStartTime: true),
                    //   controller: _startTimeController,
                    //   preficicon: IconlyLight.timeSquare,
                    // ),
                    TextField(
                      onTap: () => _pickTime(context, _startTimeController,
                          isStartTime: true),
                      controller: _startTimeController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            IconlyLight.timeSquare,
                          ),
                          hintText: "Category"),
                    ),
                    const Gap(16),
                    TextFeildWidget(
                      hinText: 'Pick End Time',
                      onTap: () => _pickTime(context, _endTimeController,
                          isStartTime: false),
                      controller: _endTimeController,
                      preficicon: IconlyLight.timeSquare,
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        const Text(
                          "Reminder Time",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        Text(
                          isSwitched ? "ON" : "OFF",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
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
                    const Gap(20),
                    Container(
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colorthem.SecondryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colorthem.SecondryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: _validateAndCreateTask,
                        child: const Text(
                          "Create",
                          style: TextStyle(
                            color: Colorthem.thirtColor,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
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
    _startTimeController.dispose();
    _endTimeController.dispose();
    categoryController.dispose();
    super.dispose();
  }
}
