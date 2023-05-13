import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends ChangeNotifier {

  static MyTimer timer = MyTimer();

  Timer? _timer;
  int _time = 0;
  int _initialTime = 0;
  int _seconds = 0;
  int _minutes = 0;
  int _hours = 0;
  final int _tick = 50; 
  bool _isStarted = false;
  bool _isRunning = false;



  int get time => _time;
  int get initialTime => _initialTime;
  int get tick => _tick;
  int get hours => _hours;
  int get minutes => _minutes;
  int get seconds => _seconds;
  bool get isRunning => _isRunning;
  bool get isStarted => _isStarted;

  void setTime(int time) {
    _initialTime = time;
    _time = _initialTime;
    notifyListeners();
  }

  void startTimer() {
    if(_time==0) return;
    _hours = hours;
    _minutes = minutes;
    _seconds = seconds;
    _isStarted = true;
    _isRunning = true;
    
    _timer = Timer.periodic(Duration(milliseconds: _tick), (timer) {
      if(_time==0) {
        stopTimer();
        reset();
        return;
      }

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

    _timer = Timer.periodic(Duration(milliseconds: _tick), (timer) {
      if(_time==0) {
        stopTimer();
        reset();
        return;
      }

      calcTime();

      notifyListeners();
    });
  }

  void calcTime() {
    _time-=_tick;
    
    _seconds = (_time / 1000).ceil() % 60;
    _minutes = (_time / 60000).floor() % 60;
    _hours = (_time / 3600000).floor();
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