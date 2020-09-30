import 'package:app/bloc/CounterBloc.dart';
// import 'package:app/cubit/CounterCubit.dart';
import 'package:app/events/CounterEvent.dart';
import 'package:app/state/CounterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  Bloc.observer = BlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CounterBloc(),
      child: MaterialApp(
          routes: {
            '/': (context)=>View1(),
            '/a': (context)=>View2()
          },
        ),
    );
  }
}

class View1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('view1'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/a');
              },
              title: Text('Route B'),
            )
          ],
        ),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state){
          return Text('${state.count}');
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> BlocProvider.of<CounterBloc>(context).add(Increment(increment: 10)),
        child: Icon(Icons.plus_one),
      )
    );
  }
}


class View2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('view1'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state){
          return Text('${state.count}');
        }
      )
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state){
            return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('pelase click..'),
                        Text('$state')
                      ],
              ),
            );
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: ()=>BlocProvider.of<CounterBloc>(context).add(Increment()),
            child: Icon(Icons.plus_one),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: '2',
            onPressed: ()=>context.bloc<CounterBloc>().add(Decrement()),
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

