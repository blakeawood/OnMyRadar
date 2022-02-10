import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_my_radar/page/home_page.dart';
import 'package:on_my_radar/provider/tasks.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = "TaskFI";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: GetMaterialApp(
        title: 'TaskFI',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context)
                .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
          ),
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
