import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model{
  int _counter = 0;

  static CountModel of(BuildContext context) =>
      ScopedModel.of<CountModel>(context);

  int get counter => _counter;


  void increment(){
    _counter++;

    notifyListeners();
  }
}