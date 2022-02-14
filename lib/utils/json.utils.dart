// import 'dart:async';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class JsonUtils {
//   static DateTime toDateTime(Timestamp value) {
//     if (value == null) return DateTime.now();

//     return value.toDate();
//   }

//   static dynamic fromDateTimeToJson(DateTime date) {
//     if (date == null) return null;

//     return date.toUtc();
//   }

//   static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
//       transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
//           StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
//               List<T>>.fromHandlers(
//             handleData: (QuerySnapshot<Map<String, dynamic>> data,
//                 EventSink<List<T>> sink) {
//               final snaps = data.docs.map((doc) => doc.data()).toList();
//               final users = snaps.map((json) => fromJson(json)).toList();

//               sink.add(users);
//             },
//           );
// }