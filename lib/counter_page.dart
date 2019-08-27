import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'counter_model.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedModelDescendant<CountModel>(
        builder: (context, child, model) {
          return Center(
            child: Text(
            '${model.counter}',
            style: Theme.of(context).textTheme.display1,
          ),
          );
        },
      ),
    );
  }
}
