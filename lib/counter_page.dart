import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:carros/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.getBloc<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: counterBloc.stream,
          builder: (context, snapshot) {
            int count = snapshot.data;
            return GestureDetector(
              onTap: _incrementCounter,
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _incrementCounter() {
    final countBloc = BlocProvider.getBloc<CounterBloc>();
    countBloc.increment();
  }
}
