import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_my_radar/main.dart';
import 'package:on_my_radar/model/task.dart';
import 'package:on_my_radar/provider/tasks.dart';
import 'package:on_my_radar/utils/theme.dart';
import 'package:on_my_radar/widget/task_form_widget.dart';
import 'package:provider/provider.dart';

class AddTaskDialogWidget extends StatefulWidget {
  AddTaskDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTaskDialogWidgetState createState() => _AddTaskDialogWidgetState();
}

class _AddTaskDialogWidgetState extends State<AddTaskDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final height = Get.height;
  final width = Get.width;
  String title = "";
  String amount = "";

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add Task",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * .02,
              ),
              TaskFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedAmount: (amount) =>
                    setState(() => this.amount = amount),
                onSavedTask: addTask,
                key: null,
              ),
            ],
          ),
        ),
      );
  void addTask() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      final task =
          Task(createdTime: DateTime.now(), amount: amount, title: title);

      // final provider = Provider.of<TasksProvider>(context, listen: false);
      // provider.addTask(task);

      Navigator.of(context).pop();
    }
  }
}
