import 'package:flutter/cupertino.dart';
import 'package:on_my_radar/utils/json.utils.dart';

class TaskField {
  static const createdTime = 'createdTime';
}

class Task {
  DateTime createdTime;
  String title;
  String? id;
  String amount;
  bool isDone;

  Task({
    required this.createdTime,
    required this.amount,
    required this.title,
    this.id,
    this.isDone = false,
  });

  // static Task fromJson(Map<String, dynamic> json) => Task(
  //       createdTime: JsonUtils.toDateTime(json['createdTime']),
  //       title: json['title'],
  //       amount: json['amount'],
  //       id: json['id'],
  //       isDone: json['isDone'],
  //     );

  // Map<String, dynamic> toJson() => {
  //       'createdTime': JsonUtils.fromDateTimeToJson(createdTime),
  //       'title': title,
  //       'amount': amount,
  //       'id': id,
  //       'isDone': isDone,
  //     };
}
