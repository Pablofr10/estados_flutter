import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:carros/counter_bloc.dart';
import 'package:carros/counter_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    final counterBloc = BlocProvider.getBloc<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _onClickCounter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<int>(
                stream: counterBloc.stream,
                builder: (context, snapshot) {
                  int count = snapshot.data;
                  return Center(
                    child: Text(
                      '$count',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    final counterBloc = BlocProvider.getBloc<CounterBloc>();
    counterBloc.increment();
  }

  void _onClickCounter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CounterPage()));
  }
}
