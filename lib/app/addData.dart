import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _dateTimeController.text =
              DateFormat('dd MMM yyyy, hh:mm a').format(finalDateTime);
        });
      }
    }
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
      appBar: AppBar(
        title: Text("Date & Time Picker Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title Field
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
                fillColor: Colors.grey.shade300,
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
                fillColor: Colors.grey.shade300,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                // suffixIcon: Icon(Icons.access_time),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),

            // Date & Time Picker Field
            // TextField(
            //   controller: _dateTimeController,
            //   readOnly: true,
            //   decoration: InputDecoration(
            //     hintText: "Pick Date & Time",

            //     border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(12)),
            //     enabled: true,
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(12)),
            //     fillColor: Colors.grey.shade300,
            //     filled: true,
            //     focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(12)),
            //     // suffixIcon: Icon(Icons.access_time),

            //     suffixIcon: Icon(Icons.calendar_today),
            //   ),
            //   onTap: () => _pickDateTime(context),
            // ),
            SizedBox(height: 16),

            // Start Time Picker Field
            TextField(
              controller: _startTimeController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Pick Start Time",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                fillColor: Colors.grey.shade300,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                suffixIcon: Icon(Icons.access_time),
              ),
              onTap: () => _pickTime(context, _startTimeController),
            ),
            SizedBox(height: 16),

            // End Time Picker Field
            TextField(
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
                fillColor: Colors.grey.shade300,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                suffixIcon: Icon(Icons.access_time),
              ),
              onTap: () => _pickTime(context, _endTimeController),
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
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
              child: Text("Submit"),
            ),
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
