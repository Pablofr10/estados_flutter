import 'package:carros/counter_bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  const BlocProvider({
    Key key,
    @required this.bloc,
    @required Widget child,
  }) : assert(bloc != null),
       assert(child != null),
       super(key: key, child: child);

  final CounterBloc bloc;

  static BlocProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider;
  }

  @override
  bool updateShouldNotify(BlocProvider old) => bloc != old.bloc;
}