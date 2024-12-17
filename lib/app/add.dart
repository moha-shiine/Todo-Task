import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:taskapp/color/them.dart';
import 'package:taskapp/controller/taskcontroller.dart';
import 'package:taskapp/view/Home.dart';
import 'package:taskapp/widget/dataCalender.dart';
import 'package:taskapp/model/taskmodel.dart';

class TaskEditPage extends StatefulWidget {
  final Taskmodel? task; // Optional parameter to pass task if updating

  const TaskEditPage({super.key, this.task});

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  final TasksController tasksController = Get.find();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();

    // If updating an existing task, populate the controllers with task data
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.subtitle;
      categoryController.text = widget.task!.category;
      _startTimeController.text = widget.task!.start_time!;
      _endTimeController.text = widget.task!.end_time!;
    }
  }

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

  void _validateAndUpdateTask() {
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

    // Update task
    final Taskmodel task = Taskmodel(
      id: widget.task?.id ?? 0, // Ensure the id exists for update
      title: _titleController.text,
      category: categoryController.text,
      subtitle: _descriptionController.text,
      start_time: _startTimeController.text,
      end_time: _endTimeController.text,
      timeTask: currentDateFormatted,
    );

    if (widget.task != null) {
      // Only update the task if it's being edited
      tasksController.updateTask(task);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text(widget.task == null ? "Create New Task" : "Edit Task"),
        leading: IconButton(
          icon: const Icon(IconlyLight.arrowLeft),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomeScreen())),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(100),
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
                    TextField(
                      onTap: () => _pickTime(context, _startTimeController,
                          isStartTime: true),
                      controller: _startTimeController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            IconlyLight.timeSquare,
                          ),
                          hintText: "Start Time"),
                    ),
                    const Gap(16),
                    TextField(
                      onTap: () => _pickTime(context, _endTimeController,
                          isStartTime: false),
                      controller: _endTimeController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(
                            IconlyLight.timeSquare,
                          ),
                          hintText: "End Time"),
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
                        onPressed: _validateAndUpdateTask,
                        child: Text(
                          "Update Task",
                          style: const TextStyle(
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
