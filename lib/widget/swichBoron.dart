import 'package:flutter/material.dart';

class RemainderSwitch extends StatefulWidget {
  @override
  _RemainderSwitchState createState() => _RemainderSwitchState();
}

class _RemainderSwitchState extends State<RemainderSwitch> {
  bool isSwitched = false;
  TimeOfDay? selectedTime;

  void _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remainder with Switch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Enable Remainder",
              style: TextStyle(fontSize: 18),
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                  if (!isSwitched) {
                    selectedTime = null; // Reset the time when switched off
                  }
                });
              },
              activeColor: Colors.green,
              inactiveThumbColor: Colors.grey,
            ),
            if (isSwitched)
              GestureDetector(
                onTap: () => _pickTime(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    selectedTime != null
                        ? selectedTime!.format(context)
                        : "Select Time",
                    style: TextStyle(color: Colors.blue.shade800, fontSize: 16),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
