import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  String taskText;
  bool isChecked;
  Function toggleCheckbox;

  TaskTile(
      {required this.taskText,
      required this.isChecked,
      required this.toggleCheckbox});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskText,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing:
          TaskCheckbox(isCheckboxChecked: isChecked, onChange: toggleCheckbox),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool isCheckboxChecked;
  final Function onChange;

  TaskCheckbox({required this.isCheckboxChecked, required this.onChange});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isCheckboxChecked,
        onChanged: (value) {
          onChange();
        });
  }
}
