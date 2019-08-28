import 'package:carros/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatelessWidget {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: StreamBuilder<int>(
        initialData: _bloc.counter,
        stream: _bloc.stream,
        builder: (context, snapshot) {
          int count = snapshot.hasData ? snapshot.data : 0;
          return Text(
            '$count',
            style: Theme.of(context).textTheme.display1,
          );
        },
      ),
    );
  }
}
