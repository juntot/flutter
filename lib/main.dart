import 'package:flutter/material.dart';

void main()=>runApp(
  MaterialApp(
    home: Home(),
  )
);

class Home extends StatelessWidget {
  final int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ues',
        style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('$count')
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Text('Add'),
        onPressed:(){

        },
        backgroundColor: Colors.red
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}