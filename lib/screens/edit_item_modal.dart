import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_my_radar/components/complete_modal_button.dart';
import 'package:on_my_radar/components/dropdown_month.dart';
import 'package:on_my_radar/components/modal_button.dart';
import 'package:on_my_radar/utils/theme.dart';

class EditItemModal extends StatelessWidget {
  final double height = Get.height;
  final double width = Get.width;

  EditItemModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.83,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, right: 22, left: 22, bottom: 18),
                child: AutoSizeText(
                  "Item On Your Radar",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: OMRTheme.primary),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4, right: 22, left: 22, bottom: 18),
                child: AutoSizeText(
                  "Below are the details for this item",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: OMRTheme.primary),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: width * .88,
                  height: height * .08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 12,
                        offset: const Offset(
                          0,
                          1,
                        ),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 0, right: 18, left: 30, bottom: 0),
                    child: Text(
                      "Name of Item",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4A34CF),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: width * .88,
                  height: height * .08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 12,
                        offset: const Offset(
                          0,
                          1,
                        ),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 0, right: 18, left: 30, bottom: 0),
                    child: Text(
                      "date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4A34CF),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: width * .88,
                  height: height * .08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 12,
                        offset: const Offset(
                          0,
                          1,
                        ),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 0, right: 18, left: 30, bottom: 0),
                    child: Text(
                      "Amount",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4A34CF),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
                child: CompleteModalButton(
                  action: () {},
                  text: 'Mark as Done',
                  textColor: Colors.white,
                  backgroundColor: const Color(0xff4A34CF),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 12, 30),
                child: ElevatedButton(
                  child: const Text(
                    'Delete Item',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
