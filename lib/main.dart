
import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';
import 'package:hello_world/pages/test2.dart';

void main()=>runApp(
  MaterialApp(
    routes: {
      '/': (context)=> Home(),
      '/test': (context) => Test2()
    },
  )
);
