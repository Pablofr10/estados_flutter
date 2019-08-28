import 'dart:async';

import 'package:flutter/material.dart';

class CounterBloc {

  //Singleton
  static final CounterBloc _instance = new CounterBloc._internal();
  factory CounterBloc(){
    return _instance;
  }

  CounterBloc._internal();


  final _controller = StreamController<int>.broadcast();
  
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