import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_my_radar/main.dart';
import 'package:on_my_radar/utils/theme.dart';
import 'package:on_my_radar/widget/add_task_dialog_widget.dart';
import 'package:on_my_radar/widget/completed_list_widget.dart';
import 'package:on_my_radar/widget/task_list_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final height = Get.height;
  final width = Get.width;

  @override
  _HomePageState createState() => _HomePageState();
}

final height = Get.height;
final width = Get.width;

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      TaskListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        title: const Text(MyApp.title),
        backgroundColor: TaskFI.primary,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: TaskFI.primary,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(
          () {
            selectedIndex = index;
          },
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: height * .1,
            color: TaskFI.primary,
          ),
          tabs[selectedIndex],
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: TaskFI.primary,
        onPressed: () => showDialog(
            builder: (context) => AddTaskDialogWidget(),
            context: context,
            barrierDismissible: false),
        child: const Icon(Icons.add),
      ),
    );
  }
}
