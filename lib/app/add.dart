import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/taskcontroller.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _timeTaskController = TextEditingController();

  final TasksController tasksController = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    _subtitleController.dispose();
    _timeTaskController.dispose();
    super.dispose();
  }

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      final taskData = {
        'title': _titleController.text,
        'category': _categoryController.text,
        'subtitle': _subtitleController.text,
        'timeTask': _timeTaskController.text.isEmpty
            ? DateTime.now().toString()
            : _timeTaskController.text,
      };

      tasksController.insertTask(taskData);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color(0xff930859),
          centerTitle: true,
          title: Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              // Task Category
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              // Task Subtitle
              TextFormField(
                controller: _subtitleController,
                decoration: InputDecoration(labelText: 'Subtitle'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subtitle';
                  }
                  return null;
                },
              ),
              // Task Time (Optional)
              TextFormField(
                controller: _timeTaskController,
                decoration: InputDecoration(labelText: 'Time (Optional)'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  // You can add time validation if necessary
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: _submitTask,
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
