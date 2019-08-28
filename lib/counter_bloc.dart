import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase{

  final _controller = BehaviorSubject<int>();

  get stream => _controller.stream;
  get setController => _controller.sink.add;

  int _counter = 0;

  void increment(){
    _counter++;

    setController(_counter);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.close();
    super.dispose();
  }
  
}