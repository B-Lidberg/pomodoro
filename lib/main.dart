import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const maxSeconds = 60*25;
  bool _isCountingDown = false;
  Duration _duration = const Duration(seconds: maxSeconds);
  Timer? timer;

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                      child: buildTime()
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  _duration.inSeconds != maxSeconds
                  ? _duration.inMilliseconds != 0
                    ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => pauseOrResumeTimer(),
                        child: Text( _isCountingDown ?'Pause' : 'Resume')
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 12)),
                      ElevatedButton(
                        onPressed: () => stopTimer(reset: true),
                        child: const Text('Cancel'))
                    ],
                  )
                  : ElevatedButton(
                    onPressed: () => resetTimer(),
                    child: const Text('Reset'),
                    )
                  : ElevatedButton(
                    onPressed: () {
                      setState(() {
                          if (!_isCountingDown) {
                            _isCountingDown = true;
                            startTimer();
                          }
                      });
                    },
                    child: const Text('Click me'),
                  )
                ],
              )
          )
      );

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));
    return Text(
      '$minutes:$seconds',
      style: const TextStyle(fontSize: 60)
    );
  }

  void stopTimer({bool reset = false}) {
    timer?.cancel();
    if (reset) {
      resetTimer();
    }
    setState(() {
      _isCountingDown = false;
    });
  }

  void resetTimer() {
    setState(() => _duration = const Duration(seconds: maxSeconds));
  }

  void pauseOrResumeTimer() {
    setState(() {
      _isCountingDown = !_isCountingDown;
    });
    if (_isCountingDown) {
      startTimer();
    } else {
      stopTimer();
    }
  }

  void startTimer() {
      timer = Timer.periodic(const Duration(seconds: 1), (_)
      {
        if (_duration.inMilliseconds > 0) {
          setState(() {
            _duration = Duration(seconds: _duration.inSeconds - 1);
          });
        } else {
          stopTimer();
        }
        print("ararar ${_duration.inSeconds}");
      });
  }
}