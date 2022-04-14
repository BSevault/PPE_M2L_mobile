import 'dart:convert';
import 'package:flutter/material.dart';
import './home/home.dart';
import './home/test.dart';


import 'requester.dart';

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: const Color(0xFF068D9D),
      ),
      home: const MyHomePage(title: 'M2L - Gestion des réunions'),
      routes: <String, WidgetBuilder>{
        '/participant': (BuildContext context) => const Test(),
      },
    );
  }
}
