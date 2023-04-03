import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';
import 'task_tile.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
            size: 40.0,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0))),
                    child: AddTask(),
                  );
                });
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50.0),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30.0,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30.0),
                    child: const Text(
                      'Todoey',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Consumer<TodoModel>(
                    builder: (context, todoData, child) {
                      return Container(
                        child: Text(
                          '${todoData.getNumberOfTasks()} Tasks',
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 300.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Consumer<TodoModel>(
                  builder: (context, todoData, child) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 30.0),
                      itemCount: todoData.getTodos().length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          taskText: todoData.getTodos()[index].text,
                          isChecked: todoData.getTodos()[index].isDone,
                          toggleCheckbox: () {
                            todoData.updateTodo(todoData.getTodos()[index]);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddTask extends StatefulWidget {
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskText = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Add Task',
          style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
        ),
        TextField(
          controller: _controller,
          autofocus: true,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
          ),
          onChanged: (newValue) {
            setState(() {
              taskText = newValue;
            });
          },
        ),
        ElevatedButton(
            onPressed: () {
              context.read<TodoModel>().add(
                    Todo(text: taskText, isDone: false),
                  );
              _controller.clear();
            },
            child: const Text('Add'))
      ],
    );
  }
}
