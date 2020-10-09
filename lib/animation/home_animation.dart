import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: _color,
        width: _width,
        margin: EdgeInsets.all(_margin),
        duration: Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                setState(() {
                  _width = MediaQuery.of(context).size.width;
                });
              },
              child: Text('Animate width'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.amber;
                });
              },
              child: Text('Animate Color'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _margin = 20;
                });
              },
              child: Text('Animate Margin'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _opacity = 0;
                });
              },
              child: Text('Animate Opacity'),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text('hide me'),
            )
          ],
        ),
      ),
    );
  }
}
