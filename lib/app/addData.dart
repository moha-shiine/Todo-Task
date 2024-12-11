import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/color/them.dart';
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  // Function for DateTime Picker
  Future<void> _pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  // Function for Time Picker
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Column(
          children: [
            Gap(50),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colorthem.thirtColor,
                  // height: ,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(10),
                        Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 10),
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomeScreen()));
                              },
                              child: Icon(
                                IconlyLight.arrowLeft,
                                size: 18,
                              )),
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
                        Gap(10),
                        dataCalenderWidget(),
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                    Gap(20),
                    Text(
                      "Create New Task",
                      style: TextStyle(
                          color: Colorthem.SecondryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Gap(50),
                    TextFeildWidget(
                      hinText: 'Title',
                      controller: _titleController,
                    ),

                    SizedBox(height: 16),
                    TextFeildWidget(
                      maxLine: 3,
                      hinText: 'Description',
                      controller: _descriptionController,
                    ),

                    SizedBox(height: 16),

                    // Start Time Picker Field
                    TextFeildWidget(
                      hinText: 'Pick Start Time',
                      onTap: () => _pickTime(context, _startTimeController),
                      controller: _startTimeController,
                      preficicon: IconlyLight.timeSquare,
                    ),
                    SizedBox(height: 16),
                    TextFeildWidget(
                      hinText: "Pick End Time",
                      onTap: () => _pickTime(context, _endTimeController),
                      controller: _endTimeController,
                      preficicon: IconlyLight.timeSquare,
                    ),

                    SizedBox(height: 20),

                    Gap(20),
                    //row RemainderSwitch(),
                    Row(
                      children: [
                        Text(
                          "Remander Time",
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

                    // Submit Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                            color: Colorthem.SecondryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colorthem.SecondryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            final title = _titleController.text;
                            final description = _descriptionController.text;
                            final dateTime = _dateTimeController.text;
                            final startTime = _startTimeController.text;
                            final endTime = _endTimeController.text;

                            if (title.isEmpty ||
                                description.isEmpty ||
                                dateTime.isEmpty ||
                                startTime.isEmpty ||
                                endTime.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Please fill out all fields!"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Submitted:\nTitle: $title\nDescription: $description\nDate & Time: $dateTime\nStart Time: $startTime\nEnd Time: $endTime",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
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
                    ),
                  ],
                ),
              ),
            ),

            Gap(20),
            // Title Field
          ],
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
    _endTimeController.dispose();
    super.dispose();
  }
}
