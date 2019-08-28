import 'package:carros/bloc_provider.dart';
import 'package:carros/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of(context).bloc;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: StreamBuilder<int>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          int count = snapshot.hasData ? snapshot.data : 0;
          return Center(
            child: GestureDetector(
              onTap: _incrementCounter,
              child: Text(
              '$count',
              style: Theme.of(context).textTheme.display1,
            ),
            ),
          );
        },
      ),
    );    
  }
  void _incrementCounter(){
    final _bloc = BlocProvider.of(context).bloc;
    _bloc.increment();
  }
}