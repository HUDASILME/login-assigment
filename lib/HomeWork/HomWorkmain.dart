import 'package:flutter/material.dart';
import 'package:home_work_and_sql/HomeWork/Body.dart';
import 'package:home_work_and_sql/HomeWork/sp_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.sp.initSP();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Body(),
    );
  }
}
