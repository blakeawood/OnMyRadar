import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_my_radar/components/dropdown_month.dart';
import 'package:on_my_radar/components/modal_button.dart';
import 'package:on_my_radar/components/radar_card.dart';
import 'package:on_my_radar/screens/dashboard.dart';
import 'package:on_my_radar/utils/theme.dart';

class AddItemModal extends StatefulWidget {
  const AddItemModal({Key? key}) : super(key: key);

  @override
  State<AddItemModal> createState() => _AddItemModalState();
}

class _AddItemModalState extends State<AddItemModal> {
  final double height = Get.height;

  final double width = Get.width;

  TextEditingController nameController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void addItemToRadar() {
    setState(() {
      Navigator.of(context).pop(MaterialPageRoute(
          builder: (context) => RadarCard(
              month: monthController.text,
              day: dayController.text,
              year: yearController.text,
              name: nameController.text,
              amount: amountController.text)));
    });
  }

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
                  "Add Item To Your Radar",
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
                  "Enter the details below for this item",
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
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, right: 22, left: 22, bottom: 8),
                    child: TextField(
                      controller: nameController,
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4A34CF),
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                          hintText: "Item Name (example: Car Taxes)",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 17),
                          filled: true,
                          fillColor: Colors.white38,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      cursorColor: const Color(0xff4A34CF),
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      enableSuggestions: false,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 8, 5, 8),
                    child: Container(
                      width: width * .43,
                      height: height * .089,
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, right: 2, left: 2, bottom: 8),
                        child: DropdownMonth(
                          text: 'Jfdaf',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
                    child: Container(
                      width: width * .43,
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
                        padding: EdgeInsets.only(
                            top: 8, right: 2, left: 2, bottom: 8),
                        child: TextField(
                          //controller: dayController,
                          textCapitalization: TextCapitalization.sentences,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4A34CF),
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              hintText: "Day",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 17),
                              filled: true,
                              fillColor: Colors.white38,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          cursorColor: Color(0xff4A34CF),
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          enableSuggestions: false,
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 8),
                child: Container(
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
                        EdgeInsets.only(top: 8, right: 22, left: 4, bottom: 8),
                    child: TextField(
                      //controller: amountController,
                      showCursor: true,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4A34CF),
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money_outlined,
                            color: Color(0xff4A34CF),
                          ),
                          hintText: "Amount",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 17),
                          filled: true,
                          fillColor: Colors.white38,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                      cursorColor: Color(0xff4A34CF),
                      autofocus: false,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      enableSuggestions: false,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 60),
                child: ModalButton(
                  action: () {
                    addItemToRadar();
                  },
                  text: 'Save Item',
                  textColor: Colors.white,
                  backgroundColor: const Color(0xff4A34CF),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
