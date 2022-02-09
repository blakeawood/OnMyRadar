import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import 'package:on_my_radar/components/dropdown_month.dart';
import 'package:on_my_radar/components/modal_button.dart';
import 'package:on_my_radar/components/radar_card.dart';

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
  final DateTime now = DateTime.now();
  final formatter = DateFormat('MM-dd');

  final List<String> radarList = [
    "home idfafd",
    "home idfafd",
    "home idfafd",
    "home idfafd",
  ];

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
                  "On My Radar",
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
            buildRadarItems(),
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
                    builder: (context) => SizedBox(
                      height: height * .80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(18, 12, 18, 55),
                              child: SizedBox(
                                width: width * .88,
                                height: height * .08,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    HapticFeedback.heavyImpact();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Add Item",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                  ),
                }),
      ),
    );
  }

  Widget buildRadarItems() => SliverToBoxAdapter(
        child: Container(
          color: Colors.white,
          height: height,
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: OMRTheme.primary,
                ),
              ),
              Positioned(
                top: -30,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: radarList.length,
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return RadarCard(
                            name: "Home insurance",
                            amount: "123",
                            day: '23',
                            //icon: Icon(Icons.more_vert),
                            month: 'NOV',
                            year: '',
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

// class RadarItem extends StatelessWidget {
//   RadarItem({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.number,
//   }) : super(key: key);

//   final IconData icon;
//   final String text;
//   final String number;

//   final height = Get.height;
//   final width = Get.width;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: width * .88,
//           height: height * .10,
//           decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 offset: const Offset(0, 8.0),
//                 blurRadius: 40.0,
//                 color: Colors.grey.withOpacity(.013),
//               ),
//             ],
//           ),
//           padding: const EdgeInsets.all(5),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: DecoratedIcon(
//                     icon,
//                     color: Colors.black,
//                     shadows: [
//                       BoxShadow(blurRadius: 12, color: OMRTheme.primary)
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   alignment: Alignment.centerLeft,
//                   child: AutoSizeText(
//                     text,
//                     style: const TextStyle(fontSize: 15),
//                     maxLines: 1,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     number.toString(),
//                     style: const TextStyle(
//                         fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
