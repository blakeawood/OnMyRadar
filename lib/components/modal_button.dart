import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalButton extends StatelessWidget {
  const ModalButton({
    Key? key,
    required this.action,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  final VoidCallback action;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;

    return Container(
      height: height * 0.08,
      width: width * .95,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 8.0),
            blurRadius: 40.0,
            color: Colors.grey.withOpacity(.013))
      ]),
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
