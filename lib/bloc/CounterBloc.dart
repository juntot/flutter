import 'dart:async';
import 'package:app/events/CounterEvent.dart';
import 'package:app/state/CounterState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(Ready());


  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if(event is Increment){
      yield Running(count: state.count + event.increment);

    }
    if(event is Decrement){
      yield Running(count: state.count -1);
    }
  }

}