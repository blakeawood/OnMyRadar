import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:on_my_radar/components/radar_card.dart';
import 'package:on_my_radar/models/task_list_widget.dart';
import 'package:on_my_radar/screens/add_radar_items_modal.dart';
import 'package:on_my_radar/utils/theme.dart';
//import 'package:/utils/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final height = Get.height;
  final width = Get.width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: OMRTheme.primary,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: OMRTheme.primary,
              expandedHeight: height * .12,
              floating: true,
              // ignore: prefer_const_constructors
              flexibleSpace: FlexibleSpaceBar(
                title: const AutoSizeText(
                  "TaskFI",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ),
              pinned: true,
              // title:
            ),
            SliverToBoxAdapter(
              child: Container(
                color: OMRTheme.primary,
                child: const AutoSizeText(
                  "Keep up with important\nfinancial events",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
            ),
            TaskListWidget(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            backgroundColor: OMRTheme.primary,
            onPressed: () => {
                  HapticFeedback.heavyImpact(),
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18),
                    )),
                    context: context,
                    builder: (context) => AddRadarItemsModal(),
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                  ).then((value) {
                    setState(() {});
                  }),
                }),
      ),
    );
  }
}
