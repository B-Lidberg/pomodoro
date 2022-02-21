import 'package:flutter/material.dart';
import 'package:pomodoro/timer/view/timer_page.dart';


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pomodoro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TimerPage(),
    );
  }
}