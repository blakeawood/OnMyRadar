import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownMonth extends StatefulWidget {
  DropdownMonth({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<DropdownMonth> createState() => _DropdownMonthState();
}

class _DropdownMonthState extends State<DropdownMonth> {
  final months = [
    "Jan",
    "Feb",
    "Mar",
    "April",
    "May",
    "June",
    "July",
    "Aug",
    "Sep",
    "Nov",
    "Dec"
  ];

  String? value;

  @override
  Widget build(BuildContext context) => Container(
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(21),
            value: value,
            isExpanded: true,
            items: months.map(buildMenuItems).toList(),
            onChanged: (value) => setState(() => this.value = value),
            hint: const Align(
              alignment: Alignment.center,
              child: Text(
                "Month",
              ),
            ),
          ),
        ),
      );

  DropdownMenuItem<String> buildMenuItems(String months) => DropdownMenuItem(
        value: months,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Text(
              months,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
