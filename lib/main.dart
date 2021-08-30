import 'package:calendar/screens/add_task.dart';
import 'package:calendar/screens/day.dart';
import 'package:calendar/screens/mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
          // fontFamily: 'Roboto'
        ),

        home:MainPage(),
        routes: {
          MainPage.id:(context)=>MainPage(),
          Day.id:(context)=>Day(),
          AddTask.id:(context)=>AddTask(),






        }
    );
  }
}

