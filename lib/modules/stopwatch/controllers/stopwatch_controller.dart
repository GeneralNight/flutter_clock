import 'dart:async';

import 'package:flutter/material.dart';

class MyStopwatch extends ChangeNotifier {
  Timer? _timer;
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
    _hours = 0;
    _minutes = 0;
    _seconds = 0;
    _isStarted = true;
    _isRunning = true;
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;
        if (_minutes == 59) {
          _hours++;
          _minutes = 0;
        } else {
          _minutes++;
        }
      }
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
      if (_seconds < 59) {
        _seconds++;
      } else if (_seconds == 59) {
        _seconds = 0;
        if (_minutes == 59) {
          _hours++;
          _minutes = 0;
        } else {
          _minutes++;
        }
      }

      notifyListeners();
    });
  }

  void reset() {
    _seconds = 0;
    _hours = 0;
    _minutes = 0;
    _isStarted = false;
    _isRunning = false;
    notifyListeners();
  }

}