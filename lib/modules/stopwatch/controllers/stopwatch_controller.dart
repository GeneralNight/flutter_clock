import 'dart:async';

import 'package:flutter/material.dart';

class MyStopwatch extends ChangeNotifier {
  Timer? _timer;
  int _time = 0;
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  bool _isStarted = false;
  bool _isRunning = false;



  int get hours => _hours;
  int get minutes => _minutes;
  int get seconds => _seconds;
  bool get isRunning => _isRunning;
  bool get isStarted => _isStarted;

  void startTimer() {
    _time = 0;
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    _isStarted = true;
    _isRunning = true;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      
      calcTime();
      
      notifyListeners();
    });    
  }

  void stopTimer() {
    if (_isStarted) {
      _isRunning = false;      
      _timer!.cancel();
    }
    notifyListeners();
  }

  void continueTimer() {
    if(_isRunning || !_isStarted) {
      return;
    }

    _isRunning = true;    

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      
      calcTime();

      notifyListeners();
    });
  }

  void calcTime() {
    _time++;
      
    _seconds = _time % 60;
    _minutes = (_time / 60).floor() % 60;
    _hours = (_time / 3600).floor();
  }

  void reset() {
    _time = 0;
    _seconds = 0;
    _hours = 0;
    _minutes = 0;
    _isStarted = false;
    _isRunning = false;
    notifyListeners();
  }

}