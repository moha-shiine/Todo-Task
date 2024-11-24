import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/color/them.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          children: [
            Gap(50),
            Expanded(
                flex: 1,
                child: Container(
                  // height: ,
                  child: dataCalenderWidget(),
                )),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                color: Colors.grey.withOpacity(0.2),
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
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Title",

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: Colors.grey.shade400,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        //  suffixIcon: Icon(Icons.access_time),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Description Field
                    TextField(
                      minLines: 3,
                      // maxLength: 2,
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: "Description",

                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: Colors.grey.shade400,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        // suffixIcon: Icon(Icons.access_time),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),

                    SizedBox(height: 16),

                    // Start Time Picker Field
                    TextFeildWidget(
                      hinText: 'Pick Start Time',
                      onTap: () => _pickTime(context, _startTimeController),
                      controller: _startTimeController,
                      preficicon: Icons.access_time,
                    ),
                    SizedBox(height: 16),

                    // End Time Picker Field
                    TextField(
                      maxLines: 1,
                      controller: _endTimeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "Pick End Time",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: Colors.grey.shade400,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12)),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      onTap: () => _pickTime(context, _endTimeController),
                    ),
                    SizedBox(height: 40),

                    // Submit Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colorthem.SecondryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colorthem.SecondryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
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
                            "Submit",
                            style: TextStyle(color: Colorthem.thirtColor),
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
