import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {

  final _controller = BehaviorSubject<int>();
  
  get stream => _controller.stream;

  int _counter = 0;

  int get counter => _counter;


  void increment(){
    _counter++;

    _controller.sink.add(_counter);
  }

  close(){

    _controller.close();
  }

}