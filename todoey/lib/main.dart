import 'package:flutter/material.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  String getNumberOfTasks() {
    return _todos.length.toString();
  }

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.markAsDone();
    notifyListeners();
  }

  List<Todo> getTodos() {
    return _todos;
  }
}

class Todo {
  String text;
  bool isDone = false;

  Todo({required this.text, required this.isDone});

  void markAsDone() {
    isDone = !isDone;
  }
}
