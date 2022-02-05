import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_my_radar/provider/tasks.dart';
import 'package:on_my_radar/screens/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: MaterialApp(
          title: 'On My Radar',
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context)
                  .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
            ),
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: Dashboard(),
        ),
      );
}
