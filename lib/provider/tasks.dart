//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:on_my_radar/api/firebase_api.dart';
import 'package:on_my_radar/model/task.dart';

class TasksProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
        createdTime: DateTime.now(),
        amount: "\$${344}",
        title: "Inusrance payment",
        id: null),
    Task(
        createdTime: DateTime.now(),
        amount: "\$${344}",
        title: "Inusrance payment",
        id: null),
    Task(
        createdTime: DateTime.now(),
        amount: "\$${344}",
        title: "Inusrance payment",
        id: null),
  ];
  List<Task> get tasks => _tasks.where((task) => task.isDone == false).toList();
  List<Task> get tasksCompleted =>
      _tasks.where((todo) => todo.isDone == true).toList();

  //void addTask(Task task) => FirebaseApi.createTask(task);

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  bool toggleTodoStatus(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();

    return task.isDone;
  }
}
