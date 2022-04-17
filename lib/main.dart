import 'package:flutter/material.dart';
import 'package:mobile/home/page_reservations.dart';
import 'package:mobile/home/template.dart';
import './home/home.dart';
import './home/test.dart';

void main() => runApp(const MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF068D9D),
      ),
      home: const MyHomePage(title: 'M2L - Gestion des réunions'),
      routes: <String, WidgetBuilder>{
        '/participant': (BuildContext context) => const Template(
              title: 'Gestion de réservations',
            ),
        '/services': (BuildContext context) => const Template(
              title: 'Service Page',
            ),
        '/covid': (BuildContext context) => const Template(
              title: 'Covid Page',
            ),
        '/reservations': ((BuildContext context) => const Reservations(
              title: 'Vos réservations',
            )),
      },
    );
  }
}
