import 'package:carros/bloc_provider.dart';
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

    final _bloc = BlocProvider.of(context).bloc;

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
                stream: _bloc.stream,
                builder: (context, snapshot){
                  int count = snapshot.hasData ? snapshot.data : 0;
                  return Text(
                  '$count',
                  style: Theme.of(context).textTheme.display1,
                );
                },
              ),
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

  void _incrementCounter(){
    final _bloc = BlocProvider.of(context).bloc;
    _bloc.increment();
  }

  void _onClickCounter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CounterPage()));
  }

  @override
  void dispose() {
    final _bloc = BlocProvider.of(context).bloc;
    // TODO: implement dispose
    super.dispose();

    _bloc.close();
  }

}
