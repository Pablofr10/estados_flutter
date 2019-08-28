import 'package:carros/counter_reduce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: StoreConnector<int, int>(
          converter: (store) => store.state,
          builder: (context, count) {
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
        ));
  }

  void _incrementCounter() {
    final store = StoreProvider.of<int>(context);
    store.dispatch(Acoes.Increment);
  }
}
