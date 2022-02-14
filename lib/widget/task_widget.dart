import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:on_my_radar/model/task.dart';
import 'package:on_my_radar/page/home_page.dart';
import 'package:on_my_radar/provider/tasks.dart';
import 'package:on_my_radar/utils/notifications.utils.dart';
import 'package:on_my_radar/utils/theme.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  const TaskWidget({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: Slidable(
          // startActionPane: ActionPane(
          //   motion: const DrawerMotion(),
          //   extentRatio: 0.25,
          //   children: [
          //     SlidableAction(
          //       backgroundColor: Colors.green,
          //       label: 'Edit',
          //       icon: Icons.edit,
          //       onPressed: (context) {},
          //     )
          //   ],
          //   key: Key(task.id ?? ""),
          // ),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.25,
            children: [
              SlidableAction(
                backgroundColor: Colors.red,
                label: 'delete',
                icon: Icons.delete,
                onPressed: (context) => deleteTask(context, task),
              )
            ],
            key: Key(task.id ?? ""),
          ),
          child: buildTask(context),
        ),
      );

  Widget buildTask(BuildContext context) => Center(
        child: Container(
          width: width * .88,
          height: height * .1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 12.0),
                blurRadius: 20.0,
                color: Colors.grey.withOpacity(.03),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Checkbox(
                      shape: const CircleBorder(),
                      activeColor: TaskFI.primary,
                      checkColor: Colors.white,
                      value: task.isDone,
                      onChanged: (_) {
                        final provider =
                            Provider.of<TasksProvider>(context, listen: false);
                        final isDone = provider.toggleTodoStatus(task);

                        showGetxSnackbar(
                            message: "This task is now marked completed",
                            title: "Nice Job!");
                      }),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: AutoSizeText(
                      task.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                ),
                AutoSizeText(
                  task.amount,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
  void deleteTask(BuildContext context, Task task) {
    final provider = Provider.of<TasksProvider>(context, listen: false);
    provider.removeTask(task);

    showGetxSnackbar(
        message: "This item has been deleted", title: "Deleted Item");
  }
}
