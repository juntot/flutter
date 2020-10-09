import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  final Function clickheart;
  Heart({this.clickheart});
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.grey[400],
        size: 30,
      ),
      onPressed: () {

      },
    );
  }
}
