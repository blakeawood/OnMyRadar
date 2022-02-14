import 'package:flutter/material.dart';
import 'package:on_my_radar/provider/tasks.dart';
import 'package:on_my_radar/widget/task_widget.dart';
import 'package:provider/provider.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    final tasks = provider.tasks;

    return tasks.isEmpty
        ? const Center(
            child: Text(
              "No Task",
              style: TextStyle(fontSize: 30),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(18),
                separatorBuilder: (context, index) => Container(
                  height: 18,
                ),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];

                  return TaskWidget(task: task);
                },
              ),
            ],
          );
  }
}
