import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_my_radar/main.dart';
import 'package:on_my_radar/utils/theme.dart';

class TaskFormWidget extends StatelessWidget {
  String title = "";
  String amount = "";
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedAmount;
  final VoidCallback onSavedTask;

  final height = Get.height;
  final width = Get.width;

  TaskFormWidget({
    Key? key,
    this.title = "",
    this.amount = "",
    required this.onChangedAmount,
    required this.onChangedTitle,
    required this.onSavedTask,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTitle(),
            SizedBox(
              height: height * .02,
            ),
            buildAmount(),
            SizedBox(
              height: height * .02,
            ),
            buildButton(),
          ],
        ),
      );
  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return "Please add a task";
          }
          return null;
        },
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Task",
            labelStyle: TextStyle(color: TaskFI.primary),
            focusColor: TaskFI.primary),
      );
  Widget buildAmount() => TextFormField(
        maxLines: 1,
        initialValue: amount,
        onChanged: onChangedAmount,
        validator: (amount) {
          if (amount!.isEmpty) {
            return "Please add an amount";
          }
          return null;
        },
        decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Amount",
            labelStyle: TextStyle(color: TaskFI.primary),
            focusColor: TaskFI.primary),
      );
  Widget buildButton() => SizedBox(
        width: double.infinity,
        height: height * .05,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black)),
          onPressed: onSavedTask,
          child: const Text(
            "Add Task",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
      );
}
